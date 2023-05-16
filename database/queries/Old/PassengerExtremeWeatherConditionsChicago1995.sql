SELECT m.date,Origin, ArrDelay, DayOfMonth, WeatherDelay, DepDelay, Cancelled, LateAircraftDelay, CancellationCode, c.* from main m
inner join chicagojuly1995 c on m.date = c.DATE
Where Year = 1995 and Month = 7
and Origin in (
    Select trim('"' from iata) from airports
    where city like '%Chicago%'
    );

SELECT m.date, avg(ArrDelay), avg(DayOfMonth), avg(DepDelay), sum(Cancelled),count(*) as notCancelled, avg(Maximum_Temperature) from main m
                                                                                                                inner join chicagojuly1995 c on m.date = c.DATE
Where Year = 1995 and Month = 7 and Origin in (
    Select trim('"' from iata) from airports
    where city like '%Chicago%')
group by m.date;


SELECT m.date, count(*), sum(Cancelled), avg(DepDelay) from main m                                                                                                                            inner join chicagojuly1995 c on m.date = c.DATE
Where Origin in (
    Select trim('"' from iata) from airports
    where city like '%Chicago%')
group by m.date;