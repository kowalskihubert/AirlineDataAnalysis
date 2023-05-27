UPDATE main_stat_sample
SET UniqueCarrier = NULLIF(UniqueCarrier, 'NA'),
    TailNum = NULLIF(TailNum, 'NA'),
    Origin = NULLIF(Origin, 'NA'),
    Dest = NULLIF(Dest, 'NA'),
    CancellationCode = NULLIF(CancellationCode, 'NA');