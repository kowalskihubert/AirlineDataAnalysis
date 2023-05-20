library(sqldf)
library(dplyr)
library(ggplot2)

source("../src/utils/createMainTable(sampled).R")

sql <- function(main_sample) {
  sqldf("SELECT problemy.UniqueCarrier as UniqueCarrierCode, Description, NumCarrierProblems, NumPlanes
        FROM (
          SELECT UniqueCarrier, COUNT(*) as NumCarrierProblems FROM main_sample
          WHERE CarrierDelay > 0
          or CancellationCode = 'A'
          GROUP BY UniqueCarrier
        ) AS problemy
        INNER JOIN
        (
          SELECT UniqueCarrier, Description, NumPlanes
          FROM (SELECT UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanes
                FROM main_sample
                GROUP BY UniqueCarrier) AS T1
          INNER JOIN carriers
          ON carriers.Code = UniqueCarrier
        ) AS T2
        ON problemy.UniqueCarrier = T2.UniqueCarrier")
}

badCarriers <- sql(mainData)
write.csv(badCarriers, "./carrier/outputs/carriersWithMostCarrierProblems.csv", row.names = F)

badCarriers <- badCarriers %>%
  mutate(ProblemsPerPlane = (round(NumCarrierProblems / NumPlanes, 3))*1000) %>%
  select(UniqueCarrierCode, Description, ProblemsPerPlane)

write.csv(badCarriers, "./carrier/outputs/carriersWithMostCarrierProblemsPerPlane.csv", row.names = F)





