library(RMySQL)
library(dplyr)
library(ggplot2)
library(ggthemr)
library(colorspace)
library(RColorBrewer)
library(corrplot)

source("./src/utils/MySqlConnect.R")

# write.csv(dbGetQuery(db, queries$BestPlanesCatchUp), "./src/carrier/outputs/Best_Plane_For_Carrier_Catchup.csv", row.names = F)
# write.csv(dbGetQuery(db, queries$BestPlanesDep), "./src/carrier/outputs/Best_Plane_For_Carrier_Dep.csv", row.names = F)
# jeszcze ogólne

bestPlanesCatchUp <- fread(file = "./src/carrier/outputs/Best_Plane_For_Carrier_Catchup.csv")[-(1:3),]
bestPlanesDep <- fread(file = "./src/carrier/outputs/Best_Plane_For_Carrier_Dep.csv")[-(1:3),]

bestPlanesCatchUp <- bestPlanesCatchUp %>%
  select(UniqueCarrier, tailnum, AvgCatchUpTime) %>%
  mutate(AvgCatchUpTime = abs(AvgCatchUpTime))

bestPlanesCatchUp <- bestPlanesCatchUp[seq(1, 66, by = 3), ] %>%
  left_join(carriers, by = join_by(UniqueCarrier == Code) ) %>%
  select(Description, tailnum, AvgCatchUpTime)

bestPlanesDep <- bestPlanesDep %>%
  select(UniqueCarrier, tailnum, AvgDepDelay)

bestPlanesDep <- bestPlanesDep[seq(1, 66, by = 3), ] %>%
  left_join(carriers, by = join_by(UniqueCarrier == Code) ) %>%
  select(Description, tailnum, AvgDepDelay)

theBestPlaneDep <- bestPlanesDep %>%
  arrange(AvgDepDelay) %>%
  head(3)

theBestPlaneCatchUp <- bestPlanesCatchUp %>%
  arrange(-AvgCatchUpTime) %>%
  head(3)
theBestPlaneCatchUp$Description[3] <- "US Airways Inc."

write_csv(theBestPlaneCatchUp, file = "src/carrier/outputs/theBestPlaneCatchUp.csv")
write_csv(theBestPlaneDep, file = "src/carrier/outputs/theBestPlaneDep.csv")


avgfleetage <- fread(file = "src/carrier/outputs/AvgFleetAgeForCarrier.csv")
planesPerformance <- fread(file = "src/carrier/outputs/Planes_Performance.csv")

planesPerformance <- planesPerformance %>%
  mutate(AvgMadeUpTimeDuringFlight = -AvgCatchUpTime) %>%
  filter(year != 'None' & year != '0000') %>%
  select(-AvgCatchUpTime) %>%
  mutate(year = as.numeric(year))

# bestPlanesCatchUpExtended <- bestPlanesCatchUp %>%
#   left_join(plane_data, by = join_by(tailnum)) %>%
#   select(Description, tailnum, AvgCatchUpTime, year) %>%
#   filter(year != 'None')
# 
# plotAge1 <- ggplot(bestPlanesCatchUpExtended, aes(x = year, y = AvgCatchUpTime )) + 
#   geom_point(size = 2) + 
#   geom_smooth()
# 
# plotAge1

# bestPlanesDepExtended <- bestPlanesDep %>%
#   left_join(plane_data, by = join_by(tailnum)) %>%
#   select(Description, tailnum, AvgDepDelay, year) %>%
#   filter(year != 'None')
# 
# plotAge1b <- ggplot(bestPlanesDepExtended, aes(x = year, y = AvgDepDelay )) +
#   geom_point(size = 2) +
#   geom_smooth()
# 
# plotAge1b


ggthemr::ggthemr(palette = "dust", layout = "scientific")
plotAge2 <- ggplot(planesPerformance, aes(x = year, y = AvgMadeUpTimeDuringFlight)) + 
  geom_point(size = 4) + 
  geom_smooth(color = "#FFC100", linewidth = 2.5) + # metoda GAM 
  labs(title = "Correlation between average made up time during flight and production year of planes",
       caption = "Negative - the plane loses time during flights") +
       ylab("Avg made up time during flight") +
       xlab("Production Year") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30, margin = margin(0.5,0,0.5,0,"cm")),
    axis.title = element_text(size = 22, margin = margin(0.8,.8,.8,.8,"cm")),
    axis.text = element_text(size = 22),
    plot.margin = margin(1,1,1,1,"cm"),
    plot.caption = element_text(size = 20)
  ) + 
  annotate("text", x = planesPerformance$year[which(planesPerformance$tailnum == "N705TW")] - 8.5,
           y = 10.3125,
           label = "That best one from Delta Air Lines ->", angle = 0, size = 8)

plotAge2

# TODO: Same correlation but AvgDepDelay instead of AvgMadeUpTime

# Correlation AvgMadeUpTime - manufacturer

manucount <- planesPerformance %>%
  group_by(manufacturer) %>%
  summarise(NumPlanes = n()) %>%
  arrange(-NumPlanes) %>%
  head(6)

planesPerformanceManu <- planesPerformance %>%
  filter(manufacturer %in% manucount$manufacturer)

data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}

manumean <- planesPerformanceManu %>%
  group_by(manufacturer) %>%
  summarise(Mean = mean(AvgMadeUpTimeDuringFlight))

plotManu <- ggplot(planesPerformanceManu, aes(x = manufacturer, y = AvgMadeUpTimeDuringFlight, group = manufacturer)) + 
  geom_violin(aes(fill = manufacturer), alpha = 0.9) +
  stat_summary(fun.data = data_summary, geom = "pointrange", size = 1.5, linewidth = 2, aes(color = "Mean")) +
  stat_summary(fun = "median",
               geom = "point",
               aes(color = "Median"), size = 4.5) +
  scale_colour_manual(values = c("red", "blue"),
                      name = "") +
  geom_line(data = manumean, aes(y = Mean , group = NA), alpha = .8, linewidth = 2, color = "slategrey") +
  labs(title = "Correlation between average made up time during flight and manufacturer of plane",
       caption = "Negative - the plane loses time during flights") +
  ylab("Avg made up time during flight") +
  xlab("Manufacturer") +
  guides(fill = F) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 25, margin = margin(0.5,0,0.5,0,"cm")),
    axis.title = element_text(size = 20, margin = margin(0.8,.8,.8,.8,"cm")),
    axis.text.x = element_text(size = 20, vjust = 0.5, angle = 30),
    axis.text.y = element_text(size = 20),
    plot.margin = margin(1,1,1,1,"cm"),
    plot.caption = element_text(size = 18),
    legend.text = element_text(size = 20)
  )

plotManu

# Correlation AvgMadeUpTime - model


# Pairs at the end to check general dependencies:
pdataPairs <- planesPerformance %>%
  select(UniqueCarrier, year, manufacturer, AvgMadeUpTimeDuringFlight)






