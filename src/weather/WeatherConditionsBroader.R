library(RMySQL)
library(ggplot2)
library(dplyr)
library(lubridate)
library(gridExtra)
library(tidyverse)
library(data.table)
source("./src/utils/MySqlConnect.R")

data <- dbGetQuery(db, queries$AtlantaAnwhr)

mean_delays_list <- list()
cancellation_list <- list()
for (col in tail(colnames(data), 7)) {
  print(col)
  data[[paste0(col, "Bin")]] <- cut(data[[col]], breaks = 6, include.lowest = TRUE)
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
      Percentage = sum(Cancelled) / sum(Flights) * 100
    )
  cancellation_matrix <- na.omit(cancellation_matrix)
  while (nrow(cancellation_matrix) < 6) {
    cancellation_matrix <- rbind(cancellation_matrix, c(0, 0))
  }
  mean_delays <- na.omit(mean_delays)
  while (nrow(mean_delays) < 6) {
    mean_delays <- rbind(mean_delays, c(0, 0, 0, 0, 0, 0))
  }
  mean_delays_list[[col]] <- mean_delays
  cancellation_list[[col]] <- cancellation_matrix
}

weatherDelayOvertime <- function() {
  subset_data <- data %>%
    filter(WeatherDelay != 0) %>%
    select(date, WeatherDelay)
  subset_data$date <- as.Date(subset_data$date)
  subset_data$Month <- month(subset_data$date)
  plot <- ggplot(subset_data, aes(x = Month, y = WeatherDelay)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(x = "Month", y = "Weather Delay")
  ggsave("src/weather/outputs/plotsBroader/weatherDelayOvertime.png", plot = plot, width = 10, height = 10, dpi = 300)
}

createHeatMap <- function() {
  heat_matrix <- data.frame(matrix(ncol = 0, nrow = 6), row.names = c("Bin1", "Bin2", "Bin3", "Bin4", "Bin5", "Bin6"))
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
    filter(colname != "SNOW")
  heatPlot2 <- ggplot(heat_matrix_2, aes(x = rowname, y = colname, fill = value)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "red") +
    labs(title = "Heatmap Plot")
  plots <- list(heatPlot, heatPlot2)
  ggsave("src/weather/outputs/plotsBroader/heatmap.png", plot = heatPlot, width = 10, height = 10, dpi = 300)
  ggsave("src/weather/outputs/plotsBroader/heatmap2.png", plot = heatPlot2, width = 10, height = 10, dpi = 300) }

createBarGraphs <- function() {
  cnt <- 1
  for (i in mean_delays_list) {
    title <- substr(colnames(i)[[1]], 1, nchar(colnames(i)[[1]]) - 3)
    data <- i
    x <- rep(data[[1]], each = 5)
    value <- as.vector(t(as.matrix(data[-1])))
    condition <- rep(c("MeanWeatherDelay", "MeanArrDelay", "MeanDepDelay", "MeanTaxiIn", "MeanTaxiOut"), times = 6)
    data <- data.frame(x, condition, value)
    plot <- ggplot(data, aes(fill = x, y = value, x = x)) +
      geom_bar(position = "dodge", stat = "identity") +
      labs(title = title, x = "X-axis", y = "Avg delay with such conditions[min]") +
      facet_wrap(facets = vars(condition), ncol = 2, scales = "free_y") +
      theme(axis.text.x = element_blank()) +
      guides(fill = guide_legend(title = paste(title, " bins")))
    ggsave(paste0("src/weather/outputs/plotsBroader/", title, ".png"), plot = plot, width = 15, height = 10, dpi = 300)
    plots[[cnt]] <- plot
    cnt <- cnt + 1
  }
  return(plots)
}

weatherDelayOvertime()
createHeatMap()
createBarGraphs()