library(RMySQL)
source("./src/utils/MySqlConnect.R")
library(dplyr)
##Finding biggest airports in dataset (total most flights between 2006 and 2008)
findBiggestAirports <- function() {
  biggessAirports <- dbGetQuery(db, queries$FindBiggestAirports)
  write.csv(biggessAirports, file = "src/passenger/outputs/biggestAirports.csv", row.names = FALSE)
}

findMostDelayedChicagoFlights <- function() {
  chicagoFlights <- dbGetQuery(db, queries$MostDelayedChicagoFlights)
  write.csv(chicagoFlights, file = "src/passenger/outputs/MostDelayedChicagoFlights.csv", row.names = FALSE)
}

findFlightsFromChicagoToCovington <- function() {
  flightsFromToChicago <- dbGetQuery(db, queries$FlightsFromChicagoToCovington)
  write.csv(flightsFromToChicago, file = "src/passenger/outputs/FlightsFromChicagoToCovington.csv", row.names = FALSE)
}

#ANALYSIS
df <- dbGetQuery(db, queries$ChicagoCovingtonWeather)
write.csv(df, file = "src/passenger/outputs/ChicagoCovingtonWeather.csv", row.names = FALSE)
df <- subset(df, select = -DATE)
df <- subset(df, select = -DATE)
weather_cols <- c("Precipitation", "Snowfall", "SnowDepth", "TemperatureMax", "TemperatureMin", "TemperatureAtObservation", "CovPrecipitation", "CovSnowfall", "CovSnowDepth", "CovTemperatureMax", "CovTemperatureMin", "CovTemperatureAtObservation")
mean_delays_list <- list()

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
      MeanCancelled = mean(Cancelled, na.rm = TRUE),
      MeanLateAircraftDelay = mean(LateAircraftDelay, na.rm = TRUE)
    )
  mean_delays_list[[col]] <- mean_delays
}
