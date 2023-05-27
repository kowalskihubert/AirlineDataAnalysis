
# pdata3 <- badSecByYear
# temp <- pdata3$Description
# temp[temp == "America West Airlines Inc. (Merged with US Airways 9/05. Stopped reporting 10/07.)"] <- "America West Airlines Inc."
# temp[temp == "US Airways Inc. (Merged with America West 9/05. Reporting for both starting 10/07.)"] <- "US Airways Inc."
# pdata3$Description <- temp
# 
# replace_0 <- badSecByYear$NumSecurityProblems
# replace_0[is.na(replace_0)] <- 0
# badSecByYear$NumSecurityProblems <- replace_0
# pdata3$NumSecurityProblems <- replace_0
# 
# pdata3 <- pdata3 %>%
#   mutate(NumSecProbPerPlane = round(NumSecurityProblems / NumPlanesThisYear, 2))

# listOfYears <- list()
# for(year in 2003:2008) {
#   listOfYears[[as.character(year)]] <- pdata3[pdata3$Year == year, ] %>%
#     arrange(-NumSecProbPerPlane) %>%
#     mutate(Description = factor(Description, levels = Description))
# }
# 
# pdata3 <- rbindlist(listOfYears, use.names = F)

# To jak dotąd wyglądało najlepiej: (wymaga powyższego fora ale nie ranków)
# plotGroups <- ggplot(pdata3, aes(x = NumSecProbPerPlane, y = Description)) + 
#   geom_bar(stat = "identity")

# pdata3 <- pdata3 %>%
#   mutate(Rank = rank(NumSecProbPerPlane) * 100,
#          Label = paste0("  ", NumSecProbPerPlane))

ggthemr::ggthemr_reset()
plotGroups <- ggplot(pdata3, aes(Rank, group = Description,
                                 fill = as.factor(Description))) + 
  geom_tile(aes(y = NumSecProbPerPlane/2, height = NumSecProbPerPlane, width =0.9), alpha = 0.8) + 
  geom_text(aes(y = 0, label = paste(Description, " ")), vjust = 0.2, hjust = 1) +
  geom_text(aes(y = NumSecProbPerPlane, label = Label, hjust = 0)) + 
  coord_flip(clip = "off", expand = FALSE) +
  #scale_y_continuous(labels = scales::comma) + 
  #scale_x_reverse() + 
  guides(fill = F) + 
  theme(
    axis.line=element_blank(),
    axis.text.x=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks=element_blank(),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),
    legend.position="none",
    panel.grid.major=element_blank(),
    panel.grid.minor=element_blank(),
    panel.grid.major.x = element_line( linewidth =.1, color="grey" ),
    panel.grid.minor.x = element_line( linewidth =.1, color="grey" ),
    plot.title=element_text(size=25, hjust=0.5, face="bold", colour="grey", vjust=-1),
    plot.subtitle=element_text(size=18, hjust=0.5, face="italic", color="grey"),
    plot.caption =element_text(size=8, hjust=0.5, face="italic", color="grey"),
    plot.margin = margin(2,2, 2, 4, "cm")
  )

# anim <- plotGroups + transition_states(Year, transition_length = 4, state_length = 4) +
#   view_follow(fixed_x = T) + 
#   labs(
#     title = "No. security issues per one plane     Year: {closest_state}"
#        )
