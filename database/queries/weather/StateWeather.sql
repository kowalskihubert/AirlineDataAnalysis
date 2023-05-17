SELECT s.state as StateName,
       a.state as StateShort,
       avg(c.latitude) as Latitude,
       avg(c.longitude) as Longitude,
       avg(WeatherDelay) as AvgWeatherDelay,
       sum(Cancelled) as CancelledFlights
from main m
inner join airports a ON (Trim(m.Origin) = Trim('"' from a.iata))
inner join states  s  ON (Trim('"' from a.state) = Trim(s.Abbreviation))
inner join capitals c ON (Trim('"' from s.state) = Trim(c.name))
where WeatherDelay >= 0
group by s.state, a.state
order by s.state;
