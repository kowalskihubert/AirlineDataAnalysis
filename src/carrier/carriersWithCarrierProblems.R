library(RMySQL)
library(dplyr)
library(ggplot2)
library(ggthemr)
library(colorspace)
library(RColorBrewer)

source("./src/utils/MySqlConnect.R")

badCarByYear <- fread(file = "./src/carrier/outputs/Bad_carrier_carrier_in_minutes_by_year.csv")

replace_0 <- badCarByYear$CollectiveCarrierDelay
replace_0[is.na(replace_0)] <- 0
badCarByYear$CollectiveCarrierDelay <- replace_0

temp <- badCarByYear$Description
temp[temp == "America West Airlines Inc. (Merged with US Airways 9/05. Stopped reporting 10/07.)"] <- "America West Airlines Inc."
temp[temp == "US Airways Inc. (Merged with America West 9/05. Reporting for both starting 10/07.)"] <- "US Airways Inc."
badCarByYear$Description<- temp

# Make CollectiveCarrierDelay be in hours
badCarByYear <- badCarByYear %>%
  mutate(CollectiveCarrierDelay = round(CollectiveCarrierDelay/60, 2)) %>%
  mutate(DelayPerPlane = round(CollectiveCarrierDelay/NumPlanesThisYear, 2))

list2 <- list()
for(year in 2003:2008) {
  list2[[as.character(year)]] <- badCarByYear[badCarByYear$Year == year, ] %>%
    arrange(-DelayPerPlane) %>%
    mutate(Rank = 1:(nrow(badCarByYear[badCarByYear$Year == year,])))
}

pdata4 <- rbindlist(list2, use.names = F)

colors2 <- list("#1C417E", "#2ca5cF", "#Afbdad" ,"#afBFFF",
"#39a65c","#afa337", "#a2ffaf", "#ffbb21",
"#f8f62f", "#9d7660", "#f06719", "#c8133b",
"#da4f7f" ,"#ea8783" ,"#eb73b3", "#593B02",
"#a26dd2" ,"#1D6A1B", "#727376")

colors <- list("#466f9d","#91b3d7" ,"#ed444a", "#feb5a2",
                        "#9d7660", "#d7b5a6" ,"#3896c4" ,"#a0d4ee",
                        "#ba7e45", "#39b87f" ,"#c8133b" ,"#ea8783")
colors <- colorRampPalette(colors)(23)

colors2 <- colorRampPalette(colors2)(23)

plotCarDelay <- ggplot(pdata4) + 
  geom_col(aes(x = Rank, y = DelayPerPlane, fill = Description), width = 0.9 , color = "black") + # Columns
  coord_flip(clip = "off", expand = FALSE) + # Flip
  labs(title = "Collective air carrier delay (in hours) per plane for each airline company", subtitle = 'Year: {closest_state}', x = "", y = "Air carrier delay per plane [hours]") + # Labels
  theme_minimal() +
  geom_text(aes(x = Rank, y = - 4, label = Description), hjust = 1, size = 7) + # Names
  geom_text(aes(x = Rank, y = DelayPerPlane + 5, label = as.character(DelayPerPlane)), hjust = 0, color = "black", size = 6) + # Values
  guides(fill = F) +
  transition_states(Year, transition_length = 80, state_length = 200) + # Animate
  theme(
    plot.title = element_text(hjust = 0.5, size = 25, face = "bold", vjust = 0.5, margin = margin(0, 0, 30, 0, "pt"), color = "#594F4F"),
    plot.subtitle = element_text(hjust = 0.5, size = 32, face = "bold", vjust = 0.5, color = "#594F4F"),
    axis.title.x = element_text(hjust = 0.5, size = 20, vjust = 1, margin = margin(20, 0, 0, 0, "pt"), color = "#594F4F"),
    axis.text.x = element_text(vjust = 0.4, size = 16),
    plot.margin = margin(3,3,3,9,"cm"),
    axis.text.y  = element_blank()
  ) +
  scale_fill_manual(values = colors2) + 
  ease_aes('back-in-out') +
  enter_fade() + 
  exit_fade()


animate(plotCarDelay, fps = 20, duration = 30, width = 1800, height = 1000, 
        renderer = gifski_renderer("src/carrier/plots/carDelayByYear.gif"))


