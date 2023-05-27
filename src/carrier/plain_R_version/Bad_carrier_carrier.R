library(sqldf)
library(dplyr)
library(ggplot2)

source("./src/utils/createMainTable(sampled).R")

sql <- function(main_sample) {
  sqldf("SELECT T2.UniqueCarrier as UniqueCarrierCode, Description, NumCarProblems, AvgNumPlanes
  FROM (
       SELECT UniqueCarrier, COUNT(*) as NumCarProblems FROM main_sample
       WHERE (CarrierDelay > 0
            or CancellationCode = 'A')
            and Year >= 2003
       GROUP BY UniqueCarrier
       ) AS problemy
    RIGHT JOIN
      (
      SELECT UniqueCarrier, Description, ROUND(AVG(NumPlanes), 1) as AvgNumPlanes
         FROM (SELECT Year, UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanes
             FROM main_sample
             WHERE Year >= 2003
             GROUP BY UniqueCarrier, Year) AS T1
         INNER JOIN carriers
         ON carriers.Code = UniqueCarrier
         GROUP BY UniqueCarrier, Description
       ) AS T2
    ON problemy.UniqueCarrier = T2.UniqueCarrier")
}

badCarriers <- sql(mainData)
write.csv(badCarriers, "./src/carrier/plain_R_version/outputs/carriersWithCarrierProblems.csv", row.names = F)

badCarriers <- badCarriers %>%
  mutate(ProblemsPerPlane = (round(NumCarProblems / AvgNumPlanes, 2))) %>%
  select(UniqueCarrierCode, Description, ProblemsPerPlane)

write.csv(badCarriers, "./src/carrier/plain_R_version/outputs/carriersWithCarrierProblemsPerPlane.csv", row.names = F)





