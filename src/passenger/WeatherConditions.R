library(RMySQL)
source("./src/utils/MySqlConnect.R")

##Finding biggest airports in dataset
biggessAirports <- dbGetQuery(db, queries$FindBiggestAirports)