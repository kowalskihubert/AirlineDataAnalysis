library(sqldf)
library(dplyr)
library(ggplot2)

source("../src/utils/createMainTable(sampled).R")

sql2 <- function(main_sample) {
  sqldf("SELECT problemy.UniqueCarrier as UniqueCarrierCode, Description, NumCarrierProblems, NumPlanes
        FROM (
          SELECT UniqueCarrier, COUNT(*) as NumCarrierProblems FROM main_sample
          WHERE SecurityDelay > 0
          or CancellationCode = 'D'
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


BadSec <- sql2(mainData)
write.csv("./carrier/outputs/carriersWithMostSecurityProblems.csv", row.names = F)
