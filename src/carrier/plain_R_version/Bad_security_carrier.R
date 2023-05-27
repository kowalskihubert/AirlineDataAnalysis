library(sqldf)
library(dplyr)
library(ggplot2)

source("./src/utils/createMainTable(sampled).R")

sql2 <- function(main_sample) {
  sqldf("SELECT T2.UniqueCarrier as UniqueCarrierCode, Description, NumSecurityProblems, AvgNumPlanes
        FROM (
          SELECT UniqueCarrier, COUNT(*) as NumSecurityProblems FROM main_sample
          WHERE (SecurityDelay > 0
          or CancellationCode = 'D')
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

badSec <- sql2(mainData)
write.csv(badSec, "./src/carrier/plain_R_version/outputs/carriersWithSecurityProblems.csv", row.names = F)
