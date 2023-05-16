SELECT main.Origin as Code, Trim('"' from airports.airport) as Airports, COUNT(*) AS num_flights FROM main
INNER JOIN airports ON (Trim(main.Origin) = Trim('"' from airports.iata))
WHERE airports.iata IS NOT NULL AND Year between 2006 and 2008
GROUP BY Origin, airport
ORDER BY num_flights DESC
LIMIT 3;


SELECT Dest, count(*) as TotalFlights,AVG(ArrDelay),AVG(DepDelay), Avg(TaxiIn), Avg(TaxiOut), SUM(Cancelled), Avg(WeatherDelay), Avg(LateAircraftDelay) from main inner join airports
on (Trim(main.Origin) = Trim('"' from airports.iata))
Where city like '%Chicago%'
  and (main.WeatherDelay > 0 or (Cancelled = 1 and CancellationCode = 'B'))
  and Year between 2006 and 2008
group by Dest
having TotalFlights > 200
order by AVG(WeatherDelay) desc;

Create table ChicagoCovington as (
SELECT m.date, m.WeatherDelay, m.ArrDelay,m.DepDelay, m.TaxiIn, m.TaxiOut, m.Cancelled, m.LateAircraftDelay
FROM main AS m
         INNER JOIN airports AS a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
         INNER JOIN airports AS a2 ON (Trim(m.Dest) = Trim('"' from a2.iata))
where ((a1.city LIKE '%Chicago%' AND a2.city LIKE '%Covington%')
  and (m.WeatherDelay > 0 or (m.Cancelled = 1 and m.CancellationCode = 'B'))
  and m.year between 2006 and 2008));

SELECT * from ChicagoCovington c
inner join weather_chicago wc on c.date = wc.DATE
inner join weather_covington w on c.date = w.DATE
order by WeatherDelay desc