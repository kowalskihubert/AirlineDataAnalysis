SELECT
    city,
    count(*) as totalFlights,
    avg(LateAircraftDelay) as avgLateAircraftDelay,
    avg(latitude) as Latitude,
    avg(longitude) as Longitude
from main m
inner join airports a ON (Trim(m.Origin) = Trim('"' from a.iata))
where LateAircraftDelay > 0 and year between 2000 and 2008
group by city
having totalFlights > 5000
order by avgLateAircraftDelay desc
limit 50;

Select * from `atlanta-weather`
where TSUN is not null and AWND is not null and PRCP is not null and TMAX is not null and TMIN is not null and SNOW is not null and SNWD is not null
limit 3;