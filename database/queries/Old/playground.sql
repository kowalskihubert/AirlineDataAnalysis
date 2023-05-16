
SELECT m.date, m.Origin, m.Dest, a1.city, a2.city
FROM main_sample AS m
         INNER JOIN airports AS a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
         INNER JOIN airports AS a2 ON (Trim(m.Origin) = Trim('"' from a2.iata))
WHERE
   m.Year BETWEEN 2006 AND 2007 Limit 10
;

SELECT m.date, m.Origin, m.Dest, m.ArrDelay, m.DepDelay, m.TaxiIn, m.TaxiOut, m.Cancelled, m.WeatherDelay, m.LateAircraftDelay
FROM main AS m
         INNER JOIN airports AS a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
         INNER JOIN airports AS a2 ON (Trim(m.Origin) = Trim('"' from a2.iata))
WHERE
    ((a1.city LIKE '%Chicago%' AND a2.city LIKE '%Atlanta%')
        OR
     (a1.city LIKE '%Covington%' AND a2.city LIKE '%Chicago%'))
#   AND (m.WeatherDelay > 0 OR (m.Cancelled = 1 AND m.CancellationCode = 'B'))
  AND m.Year BETWEEN 2006 AND 2008
;