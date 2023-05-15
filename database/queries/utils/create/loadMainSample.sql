LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1987.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');

LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1988.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');

LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1989.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');

LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1990.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1991.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1992.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1993.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1994.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1995.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1996.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1997.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1998.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/1999.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2000.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2001.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');


LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2002.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2003.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2004.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2005.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2006.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2007.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
LOAD DATA INFILE 'd:/Studia/PDU/Projekty/2/database/data/dataverse_files_sample/2008.csv'
    INTO TABLE main_sample
    FIELDS TERMINATED BY ',' ENCLOSED BY ''
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (Year,Month,DayofMonth,DayOfWeek,@DepTime,@CRSDepTime,@ArrTime,@CRSArrTime,@UniqueCarrier,@FlightNum,@TailNum,@ActualElapsedTime,@CRSElapsedTime,@AirTime,@ArrDelay,@DepDelay,@Origin,@Dest,@Distance,@TaxiIn,@TaxiOut,@Cancelled,@CancellationCode,@Diverted,@CarrierDelay,@WeatherDelay,@NASDelay,@SecurityDelay,@LateAircraftDelay)
    SET DepTime = NULLIF(@DepTime, 'NA'),
        CRSDepTime = NULLIF(@CRSDepTime, 'NA'),
        ArrTime = NULLIF(@ArrTime, 'NA'),
        CRSArrTime = NULLIF(@CRSArrTime, 'NA'),
        UniqueCarrier = NULLIF(@UniqueCarrier, 'NA'),
        FlightNum = NULLIF(@FlightNum, 'NA'),
        TailNum = NULLIF(@TailNum, 'NA'),
        ActualElapsedTime = NULLIF(@ActualElapsedTime, 'NA'),
        CRSElapsedTime = NULLIF(@CRSElapsedTime, 'NA'),
        AirTime = NULLIF(@AirTime, 'NA'),
        ArrDelay = NULLIF(@ArrDelay, 'NA'),
        DepDelay = NULLIF(@DepDelay, 'NA'),
        Origin = NULLIF(@Origin, 'NA'),
        Dest = NULLIF(@Dest, 'NA'),
        Distance = NULLIF(@Distance, 'NA'),
        TaxiIn = NULLIF(@TaxiIn, 'NA'),
        TaxiOut = NULLIF(@TaxiOut, 'NA'),
        Cancelled = NULLIF(@Cancelled, 'NA'),
        CancellationCode = NULLIF(@CancellationCode, 'NA'),
        Diverted = NULLIF(@Diverted, 'NA'),
        CarrierDelay = NULLIF(@CarrierDelay, 'NA'),
        WeatherDelay = NULLIF(@WeatherDelay, 'NA'),
        NASDelay = NULLIF(@NASDelay, 'NA'),
        SecurityDelay = NULLIF(@SecurityDelay, 'NA'),
        LateAircraftDelay = NULLIF(@LateAircraftDelay, 'NA');
