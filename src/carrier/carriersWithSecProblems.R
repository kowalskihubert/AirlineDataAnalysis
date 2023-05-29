library(RMySQL)
library(dplyr)
library(ggplot2)
library(treemapify)
library(ggthemr)
library(colorspace)
library(gganimate)
# library(gifski)
library(RColorBrewer)
library(plotly)

# source("./src/utils/MySqlConnect.R")

# write.csv(dbGetQuery(db, queries$CarriersSecProblems), "./src/carrier/outputs/Bad_security_carrier.csv", row.names = F)
# write.csv(dbGetQuery(db, queries$CarriersSecProblemsByYear), "./src/carrier/outputs/Bad_security_carrier_by_year.csv", row.names = F )

badSec <- read.csv("../src/carrier/outputs/Bad_security_carrier.csv", header = T, sep = ",")
badSecByYear <- read.csv("../src/carrier/outputs/Bad_security_carrier_by_year.csv", header = T, sep = ",")

replace_0 <- badSec$NumSecurityProblems
replace_0[is.na(replace_0)] <- 0
badSec$NumSecurityProblems <- replace_0

sumSecProb <- sum(badSec$NumSecurityProblems)
badSec <- badSec %>%
  mutate(PercOfSecurityProblems = round(NumSecurityProblems/sumSecProb, 3)*100) %>%
  mutate(NumSecProbPerPlane = round(NumSecurityProblems / AvgNumPlanes, 2))

temp <- badSec$Description
temp[temp == "America West Airlines Inc. (Merged with US Airways 9/05. Stopped reporting 10/07.)"] <- "America West Airlines Inc."
temp[temp == "US Airways Inc. (Merged with America West 9/05. Reporting for both starting 10/07.)"] <- "US Airways Inc."
badSec$Description <- temp

# Prepare data for first plot
pdata1 <- badSec %>%
  arrange(-PercOfSecurityProblems) %>%
  head(12) %>%
  select(UniqueCarrierCode, Description, PercOfSecurityProblems)

pdata1 <- pdata1 %>%
  add_row(UniqueCarrierCode = NA, Description = "Other", PercOfSecurityProblems = round(100 - sum(pdata1$PercOfSecurityProblems), 2))

# Just to get some nice colors:
# ggthemes_data[["tableau"]][["color-palettes"]][["ordered-sequential"]][["Orange-Gold"]]
# col <- darken(c("#f4d166", "#9e3a26"), amount = 0.2)

# First plot
ggthemr::ggthemr('dust')
plotPercSecProb <- ggplot(pdata1, aes(area = PercOfSecurityProblems, fill = PercOfSecurityProblems,
                      label = paste(Description, paste0(PercOfSecurityProblems, "%"), sep = "\n"))) +
  geom_treemap() + 
  geom_treemap_text(color = "white", place = "center", size = 20) + 
  labs(
    title = "Percantage of all security issues per airline company"
  ) + 
  theme(
    plot.title = element_text(hjust = 0.5, size = 30, margin = margin(0,0,20,0,"pt")),
    legend.position = "none",
    plot.margin = margin(30,10,10,10,"pt")
  ) +
  scale_fill_gradient(low = "#C4A30A", high = "#7A3226")

plotPercSecProb

pdata2 <- badSec %>%
  arrange(-NumSecProbPerPlane) %>%
  mutate(Description = factor(Description, levels = Description))

# Second plot - lollipop plot of security problems per plane
ggthemr::ggthemr(palette = 'dust', type = 'inner', layout = 'scientific', spacing = 4)
plotSecProbPerPlane <- ggplot(pdata2, aes(x = Description, y = NumSecProbPerPlane,
                text = paste(paste0("<b><i>",Description,"</i></b>"), paste0("<b><i>Issues per plane: </i></b>", NumSecProbPerPlane), sep = "\n"))) + 
  geom_point(size = 5,  stroke = 1) + 
  geom_segment(aes(x = Description, xend = Description, y = 0, yend = NumSecProbPerPlane)) + 
  xlab("Airline company") +
  ylab("No.SecIssuesPerPlane") +
  labs(
    title = "No. of security issues (all time) for each airline per one plane in their fleet"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20, margin = margin(10,0,0,0,"pt")),
    axis.text.x = element_text(angle = 30, hjust = 1),
    axis.title.x = element_text(size = 18, margin = margin(2,0,2,0,"cm")),
    axis.title.y = element_text(size = 18, margin = margin(0,2,0,2,"cm")),
    axis.text = element_text(size = 14)
  )
  # annotate("text", x = grep("Southwest Airlines Co.", pdata2$Description) + 2.5,
  #          y = pdata2$NumSecProbPerPlane[which(pdata2$Description == "Southwest Airlines Co.")] * 1.1,
  #          label = "Southwest Airlines (only) the 3rd worst", angle = 0)

# TODO: dodać grupy do tabelki i pokolorować inaczej np najgorsze i najlepsze wyniki

plotSecProbPerPlane

# Interactive version of the plot
interactivePlotSecProbPerPlane <- plotly::ggplotly(plotSecProbPerPlane, tooltip = 'text') %>%
  config(displayModeBar = F) %>%
  layout(
    hoverlabel = list(
      font = list(size = 18, color = "white", face = "italic")
    ),
    hovermode = "xy"
  ) %>%
  add_annotations(
    x = grep("Southwest Airlines Co.", pdata2$Description),
    y = pdata2$NumSecProbPerPlane[which(pdata2$Description == "Southwest Airlines Co.")],
    text = "Southwest Airlines (only) the 3rd worst",
    xref = "x",
    yref = "y",
    showarrow = T,
    arrowhead = 3,
    ax = 120,
    ay = -50
  )

interactivePlotSecProbPerPlane

# Not the best barChartRace, but easy to do
secProbRace <- ddplot::barChartRace(badSecByYear,
    x = "NumSecurityProblems",
    y = "UniqueCarrierCode",
    time = "Year",
    ease = "BackInOut",
    frameDur = 3000,
    # ease = "Linear",
    # transitionDur = 3000,
    # frameDur = 0,
    colorCategory = "Set1",
    paddingWidth = 0.2,
    xtitle = "Number of Security Issues",
    ytitle = "Airline company",
    title = "No. of security issues for each airline company and each year (2003-2008)",
    titleFontSize = 30,
    yFontSize = 11,
    timeLabelOpts = list(size = 50, prefix = "", suffix = "", xOffset = 0.35, yOffset = 1),
    bgcol = "linen" ,
    panelcol = "linen",
    xgridlinecol = "grey"
)

secProbRace

# Better race:
pdata3 <- badSecByYear
temp <- pdata3$Description
temp[temp == "America West Airlines Inc. (Merged with US Airways 9/05. Stopped reporting 10/07.)"] <- "America West Airlines Inc."
temp[temp == "US Airways Inc. (Merged with America West 9/05. Reporting for both starting 10/07.)"] <- "US Airways Inc."
pdata3$Description <- temp

replace_0 <- badSecByYear$NumSecurityProblems
replace_0[is.na(replace_0)] <- 0
badSecByYear$NumSecurityProblems <- replace_0
pdata3$NumSecurityProblems <- replace_0

pdata3 <- pdata3 %>%
  mutate(NumSecProbPerPlane = round(NumSecurityProblems / NumPlanesThisYear, 2))


list1 <- list()
for(year in 2003:2008) {
  list1[[as.character(year)]] <- pdata3[pdata3$Year == year, ] %>%
    arrange(-NumSecProbPerPlane) %>%
    mutate(Rank = 1:(nrow(pdata3[pdata3$Year == year,])))
}

pdata3 <- rbindlist(list1, use.names = F)

colors <- list("#466f9d","#91b3d7" ,"#ed444a", "#feb5a2",
  "#9d7660", "#d7b5a6" ,"#3896c4" ,"#a0d4ee",
   "#ba7e45", "#39b87f" ,"#c8133b" ,"#ea8783")
  
colors2 <- list("#1C417E", "#2ca5cF", "#Afbdad" ,"#afBFFF",
                           "#39a65c","#afa337", "#a2ffaf", "#ffbb21",
                           "#f8f62f", "#9d7660", "#f06719", "#c8133b",
                           "#da4f7f" ,"#ea8783" ,"#eb73b3", "#593B02",
                           "#a26dd2" ,"#1D6A1B", "#727376")
                         
colors <- colorRampPalette(colors)(23)
colors2 <- colorRampPalette(colors2)(23)

p <- ggplot(pdata3) + 
  geom_col(aes(x = Rank, y = NumSecProbPerPlane, fill = Description), width = 0.9 , color = "black") + # Columns
  coord_flip(clip = "off", expand = FALSE) + # Flip
  labs(title = "No. of security issues for each airline company and each year (2003-2008)", subtitle = 'Year: {closest_state}', x = "", y = "No. security issues per plane") + # Labels
  theme_minimal() +
  geom_text(aes(x = Rank, y = - 0.25, label = Description), hjust = 1, size = 7) + # Names
  geom_text(aes(x = Rank, y = NumSecProbPerPlane + 0.2, label = as.character(NumSecProbPerPlane)), hjust = 0, color = "black", size = 6) + # Values
  guides(fill = F) +
  transition_states(Year, transition_length = 80, state_length = 200) + # Animate
  theme(
    plot.title = element_text(hjust = 0.5, size = 25, face = "bold", vjust = 0.5, margin = margin(0, 0, 30, 0, "pt"), color = "#594F4F"),
    plot.subtitle = element_text(hjust = 0.5, size = 32, face = "bold", vjust = 0.5,color = "#594F4F"),
    axis.title.x = element_text(hjust = 0.5, size = 20, vjust = 1, margin = margin(20, 0, 0, 0, "pt"), color = "#594F4F"),
    axis.text.x = element_text(vjust = 0.4, size = 16),
    plot.margin = margin(3,3,3,9,"cm"),
    axis.text.y  = element_blank()
  ) +
  scale_fill_manual(values = colors2) + 
  ease_aes('back-in-out') +
    enter_fade() + 
    exit_fade()


# animate(p, fps = 20, duration = 30, width = 1800, height = 1000, 
#         renderer = gifski_renderer("src/carrier/plots/secDelaysByYear.gif"))





