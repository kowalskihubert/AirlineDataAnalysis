install.packages("leaflet")
library(leaflet)
library(maps)

m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 174.768, lat = -36.852, popup = "The birthplace of R")
m

mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>%
  addTiles() %>%
  addPolygons(fillColor = "#F5F5F5", stroke = FALSE)

