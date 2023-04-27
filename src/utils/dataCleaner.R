library(data.table)
library(textclean)
all_years_clear <- function(){
  for (year in 1987:2008) {
    print(year)
    file_path <- paste0("database/data/dataverse_files_unmodified/",year, ".csv.bz2")
    data <- fread(file_path)[0:50]
    data$TailNum <- replace_non_ascii(data$TailNum, "")
    write.csv(data,paste0("database/data/dataverse_files_sample/",year,".csv"), row.names = F, quote=FALSE, eol = "\n",fileEncoding="UTF-8")
  }
}

all_years_clear()
