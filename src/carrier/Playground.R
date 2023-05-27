library(ggplot2)
library(dplyr)
library(lubridate)
library(ggthemes)
library(devtools)
library(plotly)

p <- plane_data %>% 
  filter(!is.na(issue_date) & !is.na(year) & year!="" & issue_date != "") %>%
  filter(year(as.POSIXlt(issue_date, format = "%m/%d/%Y")) < as.numeric(year))
View(p)

p2 <- plane_data %>%
  filter(status != "Valid" & status != "")
View(p2)

p3 <- plane_data %>%
  distinct(aircraft_type)
View(p3)

# UWAGA
# Ile samolotów było wyprodukowanych w danych okresach czasu
# TODO: Porównać wyniki najgorszych lini pod względem carrier_delays ze średnią starością floty

p_clear <- plane_data %>% 
  filter(!is.na(issue_date) & !is.na(year) & year!="" & issue_date != "" & year != "None" & year != "0000") %>%
  group_by(year) %>%
  summarise(PlanesCount = n()) %>%
  mutate(year = as.numeric(year)) %>%
  mutate(ProductionYearRange = cut(year, breaks = c(1940, 1950, 1960, 1970, 1980, 1990, 1995, 2000, 2005, 2010)))
  
ggthemr::ggthemr('light', type = 'inner')
plot1 <- ggplot(p_clear, aes(x = ProductionYearRange, y = PlanesCount, text = year)) +
  geom_point(color = "gold3",size = 3) + 
  labs(title = "Number of planes produced in each year range") + 
  theme(
    
    axis.text.x = element_text(angle = 30, hjust = 1)
  )

plot1a <- ggplotly(plot1, tooltip = c("text", "y")) %>%
  config(displayModeBar = F)

plot1a


