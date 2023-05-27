library(data.table)

# Use your own path to data files
read_all <- function() {
  arr <- list()
  for (year in 1987:2008) {
    file_path_read <- paste0("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files_stat_sample/", year, ".csv")
    data <- data.table(read.csv(file_path_read, header = T, sep = ","))
    arr[[as.character(year)]] <- data
  }
  return(arr)
}

airports_loader <- function() {
  read.csv("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files_additional/airports.csv", header = TRUE, sep = ",")
}

carriers_loader <- function() {
  read.csv("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files_additional/carriers.csv", header = TRUE, sep = ",")
}

plane_data_loader <- function() {
  read.csv("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files_additional/plane-data.csv", header = TRUE, sep = ",")
}


mainData <- rbindlist(read_all(), use.names = F)
carriers <- carriers_loader()
plane_data <- plane_data_loader()
airports <- airports_loader()
