# For each carrier, the number of planes (average over years) and the number of carrier related problems
SELECT T2.UniqueCarrier as UniqueCarrierCode, Description, NumCarProblems, AvgNumPlanes
  FROM (
       SELECT UniqueCarrier, COUNT(*) as NumCarProblems FROM main_stat_sample
       WHERE (CarrierDelay > 0
            or CancellationCode = 'A')
            and Year >= 2003
       GROUP BY UniqueCarrier
       ) AS problemy
    RIGHT JOIN
      (
      SELECT UniqueCarrier, Description, ROUND(AVG(NumPlanes), 1) as AvgNumPlanes
         FROM (SELECT Year, UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanes
             FROM main_stat_sample
             WHERE Year >= 2003
             GROUP BY UniqueCarrier, Year) AS T1
         INNER JOIN carriers
         ON carriers.Code = UniqueCarrier
         GROUP BY UniqueCarrier, Description
       ) AS T2
    ON problemy.UniqueCarrier = T2.UniqueCarrier;