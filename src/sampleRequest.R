library(RMySQL)

source("./src/utils/MySqlConnect.R")

dbListTables(db)
print(queries)
res <- dbGetQuery(db, queries$GetAllSample)
dbDisconnect(db)