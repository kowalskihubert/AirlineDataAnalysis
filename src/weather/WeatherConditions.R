library(RMySQL)
library(ggplot2)
library(dplyr)
library(lubridate)
library(gridExtra)
library(tidyverse)

source("./src/utils/MySqlConnect.R")

# write.csv(dbGetQuery(db, queries$FindBiggestAirports),
#           file = "src/weather/outputs/delayedAirports.csv", row.names = FALSE)
#
write.csv(dbGetQuery(db, queries$AtlantaDestinationsWithWeatherDelays),
          file = "src/passenger/outputs/atlantaDestinations.csv", row.names = FALSE)


weatherDelayOvertime <- function() {
  subset_data <- data %>%
    filter(WeatherDelay != 0) %>%
    select(date, WeatherDelay)
  subset_data$date <- as.Date(subset_data$date)
  subset_data$Month <- month(subset_data$date, label = TRUE)
  ggplot(subset_data, aes(x = Month, y = WeatherDelay)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(x = "Month", y = "Weather Delay")

}


data <- dbGetQuery(db, queries$AtlantaBTWeather)
mean_delays_list <- list()
cancellation_list <- list()
for (col in tail(colnames(data), 12)) {
  data[[paste0(col, "Bin")]] <- cut(data[[col]], breaks = 4, include.lowest = TRUE)

  mean_delays <- data %>%
    group_by_at(paste0(col, "Bin")) %>%
    summarise(
      MeanWeatherDelay = mean(WeatherDelay, na.rm = TRUE),
      MeanArrDelay = mean(ArrDelay, na.rm = TRUE),
      MeanDepDelay = mean(DepDelay, na.rm = TRUE),
      MeanTaxiIn = mean(TaxiIn, na.rm = TRUE),
      MeanTaxiOut = mean(TaxiOut, na.rm = TRUE),
    )
  cancellation_matrix <- data %>%
    group_by_at(paste0(col, "Bin")) %>%
    summarise(
      Percentage = sum(cancelled) / sum(totalFlights) * 100
    )
  cancellation_matrix <- na.omit(cancellation_matrix)
  mean_delays <- na.omit(mean_delays)
  mean_delays_list[[col]] <- mean_delays
  cancellation_list[[col]] <- cancellation_matrix
}

createHeatMap <- function() {
  heat_matrix <- data.frame(matrix(ncol = 0, nrow = 4), row.names = c("Bin1", "Bin2", "Bin3", "Bin4"))
  for (i in cancellation_list) {
    title <- substr(colnames(i)[[1]], 1, nchar(colnames(i)[[1]]) - 3)
    values <- as.vector(t(as.matrix(i[-1])))
    heat_matrix[[title]] <- values
  }
  heat_matrix <- heat_matrix %>%
    rownames_to_column() %>%
    gather(colname, value, -rowname)
  heatPlot <- ggplot(heat_matrix, aes(x = rowname, y = colname, fill = value)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "red") +
    labs(title = "Heatmap Plot")

  heat_matrix_2 <- heat_matrix %>%
    filter(colname != "B_PRCP") %>%
    filter(colname != "A_PRCP") %>%
    filter(colname != "B_AWND")

  heatPlot2 <- ggplot(heat_matrix_2, aes(x = rowname, y = colname, fill = value)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "red") +
    labs(title = "Heatmap Plot")
  plots <- list(heatPlot, heatPlot2)
  return(plots)
}

for (i in mean_delays_list) {
  title <- substr(colnames(i)[[1]], 1, nchar(colnames(i)[[1]]) - 3)
  data <- i
  print(data)
  x <- rep(data[[1]], each = 5)
  value <- as.vector(t(as.matrix(data[-1])))
  condition <- rep(c("MeanWeatherDelay", "MeanArrDelay", "MeanDepDelay", "MeanTaxiIn", "MeanTaxiOut"), times = 4)
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
