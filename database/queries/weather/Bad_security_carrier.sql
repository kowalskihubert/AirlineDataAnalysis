# Dla każdego przewoźnika ilość samolotow we flocie (łącznie) i ilość problemów z bezpieczeństwem
# For each carrier, the number of planes in the fleet (total over years) and the number of security problems
SELECT T2.UniqueCarrier as UniqueCarrierCode, Description, NumCarrierProblems, NumPlanes
        FROM (
          SELECT UniqueCarrier, COUNT(*) as NumCarrierProblems FROM main_stat_sample
          WHERE (SecurityDelay > 0
          or CancellationCode = 'D')
          and Year >= 2003
          GROUP BY UniqueCarrier
        ) AS problemy
        RIGHT JOIN
        (
          SELECT UniqueCarrier, Description, NumPlanes
          FROM (SELECT UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanes
                FROM main_stat_sample
                WHERE Year >= 2003
                GROUP BY UniqueCarrier) AS T1
          INNER JOIN carriers
          ON carriers.Code = UniqueCarrier
        ) AS T2
        ON problemy.UniqueCarrier = T2.UniqueCarrier;


# Inny sposób mierzenia ilości samolotów w flocie - średnia liczba z lat 2003-2008, zamiast zagregowanej liczby na przestrzeni lat
# For each carrier, the number of planes in the fleet (average over years) and the number of security problems
SELECT T2.UniqueCarrier as UniqueCarrierCode, Description, NumCarrierProblems, AvgNumPlanes
        FROM (
          SELECT UniqueCarrier, COUNT(*) as NumCarrierProblems FROM main_stat_sample
          WHERE (SecurityDelay > 0
          or CancellationCode = 'D')
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

