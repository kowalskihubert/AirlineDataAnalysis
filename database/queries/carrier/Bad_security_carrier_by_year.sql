# For each year and carrier the number of planes in the fleet and the number of security problems
SELECT T2.Year, T2.UniqueCarrier as UniqueCarrierCode, Description, NumSecurityProblems, NumPlanesThisYear
        FROM (
          SELECT Year, UniqueCarrier, COUNT(*) as NumSecurityProblems FROM main
          WHERE (SecurityDelay > 0
          or CancellationCode = 'D') and Year >= 2003
          GROUP BY UniqueCarrier, Year
        ) AS problemy
        RIGHT JOIN
        (
          SELECT Year, UniqueCarrier, Description, NumPlanesThisYear
          FROM (SELECT Year, UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanesThisYear
                FROM main
                WHERE Year >= 2003
                GROUP BY UniqueCarrier, Year) AS T1
          INNER JOIN carriers
          ON carriers.Code = UniqueCarrier
          ORDER BY Year
        ) AS T2
        ON problemy.UniqueCarrier = T2.UniqueCarrier and problemy.Year = T2.Year
        ORDER BY Year, UniqueCarrierCode;
# Null means that there were no security problems in that year for that carrier


# Warto zacząć dopiero od 1995, bo wcześniej nie ma danych o tailnum, więc nie wiemy ile było samolotów we flocie
# Przed 2003 rokiem nie mamy danych o rodzajach opóźnień, więc musimy zacząć od 2003
# We should start from 1995 because before that year we don't have data about tailnum, so we don't know how many planes there were
# Before 2003 we don't have data about types of delays, so we have to start from 2003
SELECT Year, UniqueCarrier, Description, NumPlanesThisYear
          FROM (SELECT Year, UniqueCarrier, COUNT(DISTINCT TailNum) as NumPlanesThisYear
                FROM main_stat_sample
                WHERE Year >= 2003
                GROUP BY UniqueCarrier, Year) AS T1
          INNER JOIN carriers
          ON carriers.Code = UniqueCarrier
          ORDER BY Year;


# Ile w każdym roku było przewoźników?
# How many carriers were there in each year?
SELECT Year, Count(DISTINCT UniqueCarrier) FROM main_stat_sample
WHERE Year >= 2003
GROUP BY Year;


