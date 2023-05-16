Create table atlanta as (Select date,
                                a2.state,
                                a2.city,
                                Cancelled,
                                Distance,
                                ArrDelay,
                                DepDelay,
                                TaxiOut,
                                TaxiIn,
                                WeatherDelay
                         from main m
                                  inner join airports a1 ON (Trim(m.Origin) = Trim('"' from a1.iata))
                                  inner join airports a2 ON (Trim(m.Dest) = Trim('"' from a2.iata))
                         where a1.city like '%Atlanta%'
                           and year between 2005 and 2007);

Select m.date,
       Count(*)            as Flights,
       sum(m.Cancelled)    as Cancelled,
       avg(m.Distance)     as Distance,
       avg(m.ArrDelay)     as ArrDelay,
       avg(m.DepDelay)     as DepDelay,
       avg(m.TaxiOut)      as TaxiOut,
       avg(m.TaxiIn)       as TaxiIn,
       avg(m.WeatherDelay) as WeatherDelay,
       avg(w.AWND)         as AWND,
       avg(w.PGTM)         as PGTM,
       avg(w.PRCP)         as PRCP,
       avg(w.SNOW)         as SNOW,
       avg(w.SNWD)         as SNWD,
       avg(w.TMAX)         as TMAX,
       avg(w.TMIN)         as TMIN
from atlanta m
         inner join `atlanta-weather` w on (m.date = w.date)
group by m.date