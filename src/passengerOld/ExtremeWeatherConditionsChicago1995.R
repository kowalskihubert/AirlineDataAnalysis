library(RMySQL)
source("./src/utils/MySqlConnect.R")
library(dplyr)
library(ggplot2)
library(tidyverse)

df <- dbGetQuery(db, queries$Chicago1995Weather)
df <- subset(df, select = c(-DATE, -DayOfMonth, -LateAircraftDelay, -WeatherDelay, -CancellationCode, -Average_Temperature))
mean_delays_list <- list()
cancellation_list <- list()
for (col in tail(colnames(df), 8)) {
  print(col)
  df[[paste0(col, "Bin")]] <- cut(df[[col]], breaks = 3, include.lowest = TRUE)

  mean_delays <- df %>%
    group_by_at(paste0(col, "Bin")) %>%
    summarise(
      MeanArrDelay = mean(ArrDelay, na.rm = TRUE),
      MeanDepDelay = mean(DepDelay, na.rm = TRUE),
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
  print(title)
  data <- head(i, -1)
  x <- rep(data[[1]], each = 2)
  value <- as.vector(t(as.matrix(data[-1])))
  condition <- rep(c("MeanArrDelay", "MeanDepDelay"), times = 3)
  data <- data.frame(x, condition, value)
  plot <- ggplot(data, aes(fill = x, y = value, x = x)) +
    geom_bar(position = "dodge", stat = "identity") +
    labs(title = title, x = "X-axis", y = "Avg delay with such conditions[min]") +
    facet_wrap(facets = vars(condition), ncol = 2, scales = "free_y") +
    theme(axis.text.x = element_blank()) +
    guides(fill = guide_legend(title = paste(title, " bins")))
  ggsave(paste0("src/passenger/outputs/extremePlots/", title, ".png"), plot = plot, width = 10, height = 10, dpi = 300)
  plots[[cnt]] <- plot
  cnt <- cnt + 1
}

heat_matrix <- data.frame(matrix(ncol = 0, nrow = 3), row.names = c("Bin1", "Bin2", "Bin3"))
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
heatPlot
plot_list <- list()
plot_list[[1]] <- heatPlot
plot_list[[2]] <- plots
return(plot_list)
return(mean_delays_list)


