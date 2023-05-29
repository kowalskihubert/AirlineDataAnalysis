library(RMySQL)
library(dplyr)
library(ggplot2)
library(ggthemr)
library(colorspace)
library(RColorBrewer)
library(corrplot)
library(ggborderline)
library(plotly)
library(ggthemes)


# source("./src/utils/MySqlConnect.R")

badCarByYear <- fread(file = "../src/carrier/outputs/Bad_carrier_carrier_in_minutes_by_year.csv")
satisfactionByYear <- fread(file = "../database/data/american-customer-satisfaction-index-scores-for-airlines-in-the-us-1995-2023.csv")

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
  mutate(DelayPerPlane = round(CollectiveCarrierDelay/NumPlanesThisYear, 2)) %>%
  filter(Description == "Southwest Airlines Co." | Description == "Delta Air Lines Inc." | Description ==  "United Air Lines Inc." | Description == "American Airlines Inc.")

satisfactionByYear <- satisfactionByYear %>%
  rename(Year = V1) %>%
  select(Year, `Southwest Airlines`, `Delta Air Lines`, `United Airlines`, `American Airlines`) %>%
  filter(Year <= 2008 & Year >= 2003) %>%
  mutate(Year = as.numeric(Year))

values <- c()
tmp <- satisfactionByYear %>%
  select( `Southwest Airlines`, `Delta Air Lines`,`United Airlines`,`American Airlines` )
for(i in 1:nrow(tmp)) {
  values <- c(values, tmp[i])
}
names(values) <- NULL
values <- unlist(values)
satisfactionByYearTable <- data.frame(
  Year = rep(2003:2008, each = 4),
  Description = rep(c("Southwest Airlines Co.", "Delta Air Lines Inc.","United Air Lines Inc." ,"American Airlines Inc."), times = 6),
  SatisfactionIndex = values
)

satisfactionByYearTable <- satisfactionByYearTable %>%
  inner_join(badCarByYear)


plotSatisfaction  <- ggplot(satisfactionByYearTable, aes(x = Year, y = DelayPerPlane, color = Description,
                        text = paste(Description, SatisfactionIndex, DelayPerPlane, sep = "\n"))) + 
  geom_borderline(aes(x = Year, y = SatisfactionIndex), linewidth = 2, linetype = "dotdash", bordercolor = "black", alpha = 0.85) + 
  geom_line(linewidth = 3) + 
  geom_point(size = 4) + 
  scale_color_canva(palette = 'Bold and punchy', name = "Airlines:") + 
  labs(title = "Average delay per plane and satisfaction index in time",
       subtitle = "For 4 major US Airlines") + 
  ylab("Delay Per Plane and Satisfaction Index") + 
  theme(
    plot.title = element_text(size = 30, hjust = 0.5),
    plot.subtitle = element_text(size = 30, hjust = 0.5), 
    axis.title = element_text(size = 20, margin = margin(1,1,1,1,"cm")),
    axis.text = element_text(size = 20),
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 20)
  )

plotSatisfaction

plotSatisfactionNoBorder  <- ggplot(satisfactionByYearTable, aes(x = Year, y = DelayPerPlane, color = Description,
                     ) ) + 
  geom_line(data = (satisfactionByYearTable %>% filter(Description == "Southwest Airlines Co.")), aes(x = Year, y = SatisfactionIndex), linewidth = 2.1, color = "black", inherit.aes = F) +
  geom_line(data = (satisfactionByYearTable %>% filter(Description == "Delta Air Lines Inc.")), aes(x = Year, y = SatisfactionIndex), linewidth = 2.1, color = "black", inherit.aes = F) +
  geom_line(data = (satisfactionByYearTable %>% filter(Description == "United Air Lines Inc.")), aes(x = Year, y = SatisfactionIndex), linewidth = 2.1, color = "black", inherit.aes = F) +
  geom_line(data = (satisfactionByYearTable %>% filter(Description == "American Airlines Inc.")), aes(x = Year, y = SatisfactionIndex), linewidth = 2.1, color = "black", inherit.aes = F) +
  geom_line(aes(x = Year, y = SatisfactionIndex, color = Description), linewidth = 2, linetype = "dotdash", alpha = 0.8, inherit.aes = F) +
  geom_line(aes(x = Year, y = DelayPerPlane, color = Description, text = SatisfactionIndex), linewidth = 3, inherit.aes = F) + 
  geom_point(size = 4) + 
  scale_color_canva(palette = 'Bold and punchy', name = "Airlines:") + 
  labs(title = "Average delay per plane and satisfaction index in time",
       subtitle = "For 4 major US Airlines") + 
  ylab("Delay Per Plane and Satisfaction Index") + 
  theme(
    plot.title = element_text(size = 20, hjust = 0.5),
    plot.subtitle = element_text(size = 20, hjust = 0.5), 
    axis.title = element_text(size = 18, margin = margin(1,1,1,1,"cm")),
    axis.text = element_text(size = 18),
    legend.title = element_text(size = 18),
    legend.text = element_text(size = 18),
    legend.box.margin = margin(1,1,1,1,"cm")
  )


plotSatiAnimated <- ggplotly(plotSatisfactionNoBorder, tooltip = c("color","y","text"), dynamicTicks = T) %>%
  layout(hovermode = "x unified") %>%
  style(hoverinfo = "skip", traces = 1) %>%
  style(hoverinfo = "skip", traces = 2) %>%
  style(hoverinfo = "skip", traces = 3) %>%
  style(hoverinfo = "skip", traces = 4) %>%
  style(hoverinfo = "skip", traces = 5) %>%
  style(hoverinfo = "skip", traces = 6) %>%
  style(hoverinfo = "skip", traces = 7) %>%
  style(hoverinfo = "skip", traces = 8) %>%
  style(hoverinfo = "skip", traces = 13) %>%
  style(hoverinfo = "skip", traces = 14) %>%
  style(hoverinfo = "skip", traces = 15) %>%
  style(hoverinfo = "skip", traces = 16) %>%
  config(displayModeBar = F)


plotSatiAnimated



