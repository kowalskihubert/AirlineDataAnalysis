library(leaflet)

assign_shades_of_red <- function(data_input) {
  mapStates <- map("state", fill = TRUE, plot = FALSE)
  data <- list()
  for (name in mapStates$names) {
    if (grepl("main", name)) {
      name <- substring(name, 1, nchar(name) - 5)
    }
    if (name %in% tolower(data_input$StateName)) {
      data <- rbind(data, data_input[tolower(data_input$StateName) == name,])
    } else {
      data <- rbind(data, c(0, 0, 0, 0, 0, 0))
    }
  }
  avgWeatherDelays <- data$AvgWeatherDelay
  max_avgWeatherDelays <- max(avgWeatherDelays)
  min_avgWeatherDelays <- min(avgWeatherDelays)
  color <- colorNumeric(palette = "Reds", domain = c(min_avgWeatherDelays, max_avgWeatherDelays))(avgWeatherDelays)
  print(c(color, avgWeatherDelays))
  map <- leaflet(mapStates) %>%
    addProviderTiles(providers$Stamen.Toner) %>%
    setView(lng = -98.5833, lat = 39.8333, zoom = 4)

  map <- map %>%
    addPolygons(
      fillColor = color,
      fillOpacity = 0.8,
      color = "black",
      weight = 1,
    )

  for (i in seq_len(nrow(data))) {
    map <- addMarkers(
      map,
      lng = data$Longitude[i],
      lat = data$Latitude[i],
      popup = paste0("<b>", data$StateName[i], "</b><br>",
                     "AvgDelay: ", data$AvgWeatherDelay[i]),
      popupOptions = popupOptions(
        style = "background-color: red;"
      )
    )
  }
  return(map)
}

states_weather_nonzero <- read.csv("./src/weather/outputs/StatesWeatherDelaysNonzero.csv")
states_weather <- read.csv("./src/weather/outputs/StatesWeatherDelays.csv")

assign_shades_of_red(states_weather_nonzero)
assign_shades_of_red(states_weather)

mapStates <- map("state", fill = TRUE, plot = FALSE)

