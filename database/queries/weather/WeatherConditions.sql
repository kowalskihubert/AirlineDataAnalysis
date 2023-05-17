Select airport, count(*) as totalFLights, avg(WeatherDelay) as averageWeatherDelay from main
inner join airports ON (Trim(main.Origin) = Trim('"' from airports.iata))
where Year between 2005 and 2007
group by airport
having totalFLights > 50000
order by averageWeatherDelay Desc
limit 3;


Select a2.city, count(*) as totalFlights, avg(WeatherDelay) as averageWeatherDelay from main m
inner join airports a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
inner join airports a2 ON (Trim(m.Dest) = Trim('"' from a2.iata))
where a1.city like '%Atlanta%'
and Year between 2005 and 2007
group by a2.city
having totalFlights > 1000
order by averageWeatherDelay desc
limit 3;

Create table AtlantaBT as (
SELECT date, count(*) totalFlights, sum(Cancelled) as cancelled, Avg(ArrDelay), Avg(DepDelay), AVG(TaxiIn),avg(TaxiOut), Avg(WeatherDelay)  from main m
inner join airports a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
inner join airports a2 ON (Trim(m.Dest) = Trim('"' from a2.iata))
where a1.city like '%Atlanta%' and a2.city like '%Baton Rouge%'
and Year between 2005 and 2007
group by date);

SELECT
    a.date,
    avg(totalFlights) as totalFlights,
    avg(cancelled) as cancelled,
    Avg(`avg(ArrDelay)`) as ArrDelay,
    Avg(`avg(DepDelay)`) as DepDelay,
    Avg(`avg(TaxiIn)`) as TaxiIn,
    Avg(`avg(TaxiOut)`) as TaxiOut,
    Avg(`avg(WeatherDelay)`) as WeatherDelay,
    Avg(aw.AWND) as A_AWND,
    Avg(aw.PGTM) as A_PGTM,
    Avg(aw.PRCP) as A_PRCP,
    Avg(aw.TAVG) as A_TAVG,
    Avg(aw.TMAX) as A_TMAX,
    Avg(aw.TMIN) as A_TMIN,
    Avg(bw.AWND) as B_AWND,
    Avg(bw.PGTM) as B_PGTM,
    Avg(bw.PRCP) as B_PRCP,
    Avg(bw.TAVG) as B_TAVG,
    Avg(bw.TMAX) as B_TMAX,
    Avg(bw.TMIN) as B_TMIN
from AtlantaBT a
inner join `atlanta-weather` aw on (a.date = aw.DATE)
inner join `br-weather` bw on a.date = bw.DATE
group by date
