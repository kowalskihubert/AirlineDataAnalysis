SELECT Origin, COUNT(*) AS num_flights FROM main WHERE Year between 2000 AND 2008 GROUP BY Origin ORDER BY num_flights DESC LIMIT 3;
