library(RMySQL)
library(leaflet)
library(maps)

cascade <- read.csv("./src/weather/outputs/cascade.csv")
cascadeWeather <- read.csv("./src/weather/outputs/cascadeWeather.csv")

mapCities <- function(data, data2) {
  mapStates <- map("state", fill = TRUE, plot = FALSE)
  map <- leaflet(mapStates) %>%
    addProviderTiles(providers$Stamen.Toner) %>%
    setView(lng = -98.5833, lat = 39.8333, zoom = 4) %>%
    addLayersControl(
      overlayGroups = c("cities_delay", "weather_cities_delay", "weather_cities_weather_delay"),
      options = layersControlOptions(collapsed = FALSE)
    )
  map <- map %>%
    addPolygons(
      fillOpacity = 0.5,
      color = "goldenrod",
      weight = 1,
    )
  max_avgLateAircraftDelay <- max(data$avgLateAircraftDelay)
  max_avgLateAircraftDelayWeather <- max(data2$avgLateAircraftDelay)
  max_avgWeatherDelay <- max(data2$avgWeatherDelay)
  for (i in seq_len(nrow(data))) {
    map <- addCircleMarkers(
      map,
      lng = data$Longitude[i],
      lat = data$Latitude[i],
      group = "cities_delay",
      radius = data$avgLateAircraftDelay[i] / max_avgLateAircraftDelay * 20,
      fillOpacity = .7,
      color = "yellow",
      stroke = FALSE,
      popup = paste0("<b>", data$city[i], "</b><br>",
                     "AvgLateAircraftDelay: ", data$avgLateAircraftDelay[i]),
      popupOptions = popupOptions(
        style = "opacity:0"
      )
    )
  }
  for (i in seq_len(nrow(data2))) {
    map <- addCircleMarkers(
      map,
      lng = data2$Longitude[i],
      lat = data2$Latitude[i],
      group = "weather_cities_delay",
      radius = data2$avgWeatherDelay[i] / max_avgWeatherDelay * 20,
      fillOpacity = .7,
      color = "orange",
      stroke = FALSE,
      popup = paste0("<b>", data2$city[i], "</b><br>",
                     "AvgLateAircraftDelay: ", data2$avgLateAircraftDelay[i]),
      popupOptions = popupOptions(
        style = "opacity:0"
      )
    )
    map <- addCircleMarkers(
      map,
      lng = data2$Longitude[i],
      lat = data2$Latitude[i],
      group = "weather_cities_weather_delay",
      radius = data2$avgLateAircraftDelay[i] / max_avgLateAircraftDelayWeather * 20,
      fillOpacity = .7,
      color = "red",
      stroke = FALSE,
      popup = paste0("<b>", data2$city[i], "</b><br>",
                     "AvgWeatherDelay: ", data2$avgWeatherDelay[i]),
      popupOptions = popupOptions(
        style = "opacity:0"
      )
    )
  }

  return(map)
}

mapCities(cascade, cascadeWeather)