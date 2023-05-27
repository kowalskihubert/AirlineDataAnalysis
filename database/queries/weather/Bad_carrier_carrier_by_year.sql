# For each year and carrier the number of planes in the fleet and the number of carrier related problems
SELECT T2.Year, T2.UniqueCarrier as UniqueCarrierCode, Description, NumCarrierProblems, NumPlanesThisYear
        FROM (
          SELECT Year, UniqueCarrier, COUNT(*) as NumCarrierProblems FROM main_stat_sample
          WHERE (CarrierDelay > 0
          or CancellationCode = 'A') and Year >= 2003
          GROUP BY UniqueCarrier, Year
        ) AS problemy
        RIGHT JOIN
        (
          SELECT Year, UniqueCarrier, Description, NumPlanesThisYear
          FROM (SELECT Year, UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanesThisYear
                FROM main_stat_sample
                WHERE Year >= 2003
                GROUP BY UniqueCarrier, Year) AS T1
          INNER JOIN carriers
          ON carriers.Code = UniqueCarrier
          ORDER BY Year
        ) AS T2
        ON problemy.UniqueCarrier = T2.UniqueCarrier and problemy.Year = T2.Year
        ORDER BY Year, UniqueCarrierCode