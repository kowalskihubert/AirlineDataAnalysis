library(RMySQL)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(tidyverse)

##Finding biggest airports in dataset (total most flights between 2006 and 2008)
findBiggestAirports <- function() {
  biggessAirports <- dbGetQuery(db, queries$FindBiggestAirports)
  write.csv(biggessAirports, file = "src/passenger/outputs/biggestAirports.csv", row.names = FALSE)
  return(biggessAirports)
}

findMostDelayedChicagoFlights <- function() {
  chicagoFlights <- dbGetQuery(db, queries$MostDelayedChicagoFlights)
  write.csv(chicagoFlights, file = "src/passenger/outputs/MostDelayedChicagoFlights.csv", row.names = FALSE)
  return(chicagoFlights)
}

findFlightsFromChicagoToCovington <- function() {
  flightsFromToChicago <- dbGetQuery(db, queries$FlightsFromChicagoToCovington)
  write.csv(flightsFromToChicago, file = "src/passenger/outputs/FlightsFromChicagoToCovington.csv", row.names = FALSE)
  return(flightsFromToChicago)
}

#ANALYSIS
analysis <- function() {

  df <- dbGetQuery(db, queries$ChicagoCovingtonWeather)
  df <- subset(df, select = -DATE)
  df <- subset(df, select = -DATE)
  weather_cols <- c("Precipitation", "Snowfall", "SnowDepth", "TemperatureMax", "TemperatureMin", "TemperatureAtObservation", "CovPrecipitation", "CovSnowfall", "CovSnowDepth", "CovTemperatureMax", "CovTemperatureMin", "CovTemperatureAtObservation")
  mean_delays_list <- list()
  cancellation_list <- list()
  for (col in weather_cols) {
    df[[paste0(col, "Bin")]] <- cut(df[[col]], breaks = 7, include.lowest = TRUE)

    mean_delays <- df %>%
      group_by_at(paste0(col, "Bin")) %>%
      summarise(
        MeanWeatherDelay = mean(WeatherDelay, na.rm = TRUE),
        MeanArrDelay = mean(ArrDelay, na.rm = TRUE),
        MeanDepDelay = mean(DepDelay, na.rm = TRUE),
        MeanTaxiIn = mean(TaxiIn, na.rm = TRUE),
        MeanTaxiOut = mean(TaxiOut, na.rm = TRUE),
        MeanLateAircraftDelay = mean(LateAircraftDelay, na.rm = TRUE)
      )
    cancellation_matrix <- df %>%
      group_by_at(paste0(col, "Bin")) %>%
      summarise(
        Percentage = sum(Cancelled) / n() * 100
      )
    mean_delays_list[[col]] <- mean_delays
    cancellation_list[[col]] <- cancellation_matrix
  }
  plots <- list()
  cnt <- 1
  for (i in mean_delays_list) {
    title <- substr(colnames(i)[[1]], 1, nchar(colnames(i)[[1]]) - 3)
    data <- head(i, -1)
    x <- rep(data[[1]], each = 6)
    value <- as.vector(t(as.matrix(data[-1])))
    condition <- rep(c("MeanWeatherDelay", "MeanArrDelay", "MeanDepDelay", "MeanTaxiIn", "MeanTaxiOut", "MeanLateAircraftDelay"), times = 7)
    data <- data.frame(x, condition, value)
    plot <- ggplot(data, aes(fill = x, y = value, x = x)) +
      geom_bar(position = "dodge", stat = "identity") +
      labs(title = title, x = "X-axis", y = "Avg delay with such conditions[min]") +
      facet_wrap(facets = vars(condition), ncol = 2, scales = "free_y") +
      theme(axis.text.x = element_blank()) +
      guides(fill = guide_legend(title = paste(title, " bins")))
    ggsave(paste0("src/passenger/outputs/plots/", title, ".png"), plot = plot, width = 10, height = 10, dpi = 300)
    plots[[cnt]] <- plot
    cnt <- cnt + 1
  }

  heat_matrix <- data.frame(matrix(ncol = 0, nrow = 7), row.names = c("Bin1", "Bin2", "Bin3", "Bin4", "Bin5", "Bin6", "Bin7"))
  for (i in cancellation_list) {
    data <- head(i, -1)
    title <- substr(colnames(i)[[1]], 1, nchar(colnames(i)[[1]]) - 3)
    values <- as.vector(t(as.matrix(data[-1])))
    heat_matrix[[title]] <- values
  }
  heat_matrix <- heat_matrix %>%
    rownames_to_column() %>%
    gather(colname, value, -rowname)

  heatPlot <- ggplot(heat_matrix, aes(x = rowname, y = colname, fill = value)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "red") +
    labs(title = "Heatmap Plot")
  plot_list = list()
  plot_list[[1]] <- heatPlot
  plot_list[[2]] <- plots
  return(plot_list)
}
