library(RMySQL)
library(DBI)
library(readr)
db <- dbConnect(RMySQL::MySQL(), user = 'root', password = read_file("./passwd.txt"), dbname = 'airplanes', host = 'localhost')

queries_csv <- read.csv("./src/queries.csv", header = T, sep=";")

name_vec <- queries_csv$Name
query_vec <- queries_csv$Query
queries <- list()
for (i in 1:length(name_vec)) {
  queries[[name_vec[i]]] <- query_vec[i]
}
