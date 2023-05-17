library(RMySQL)

source("../utils/MySqlConnect.R")

dbListTables(db)
print(queries)
res <- dbGetQuery(db, queries$GetAllSample)
res2 <- dbGetQuery(db, queries$TestSample)
dbDisconnect(db)
