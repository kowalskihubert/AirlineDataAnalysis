library(data.table)

for (year in 1987:2008) {
  print(year)
  file_path_read <- paste0("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files/", year, ".csv")
  data <- data.table(read.csv(file_path_read, header = T, sep = ","))
  data <- data[sample(1:nrow(data), 10000, replace = F),]
  file_path_write <- paste0("/Volumes/USB_DISK_1/AirlineDataAnalysis/dataverse_files_stat_sample/", year, ".csv")
  write.csv(data, file_path_write, row.names = F)
}

