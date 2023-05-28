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

