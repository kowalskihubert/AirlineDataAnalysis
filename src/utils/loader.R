library(data.table)
airports_loader <- function(){
  read.csv("data/dataverse_files/airports.csv", header = TRUE, sep = ",")
}

carriers_loader <- function(){
  read.csv("data/dataverse_files/carriers.csv", header = TRUE, sep = ",")
}

plane_data_loader <- function(){
  read.csv("data/dataverse_files/plane-data.csv", header = TRUE, sep = ",")
}
variable_description_loader <- function(){
  read.csv("data/dataverse_files/variable-description.csv", header = TRUE, sep = ",")
}

all_years_loader <- function(){
  arr <- list()
  for (year in 1987:2008) {
    print(year)
    file_path <- paste0("database/data/dataverse_files/",year, ".csv.bz2")
    arr[[as.character(year)]] <- fread(file_path)
  }
  return (arr)
}
