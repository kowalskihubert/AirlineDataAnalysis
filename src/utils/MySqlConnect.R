library(RMySQL)
library(DBI)
library(readr)

db <- dbConnect(RMySQL::MySQL(), user = 'root', password = read_file("passwd.txt"), dbname = 'airplanes', host = 'localhost')

queries_csv <- tryCatch(
  read.csv("../src/queries.csv", header = TRUE),
  error = function(e) {
    message("File not found. Trying with an alternate path...")
    read.csv("./src/queries.csv", header = TRUE)
  }
)
name_vec <- queries_csv$Name
query_vec <- queries_csv$Query
queries <- list()
for (i in seq_along(name_vec)) {
  queries[[name_vec[i]]] <- query_vec[i]
}
