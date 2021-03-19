#convert CSV config files to RDS 

filesED <- list.files(path = "trustName-config/ed", pattern = "*.csv") #edit trust name
filesIP <- list.files(path = "trustName-config/ip", pattern = "*.csv") #edit trust name

for (fname in filesED){
  df <- read.csv(paste0("trustName-config/ed","/",fname)) #edit trust name
  saveRDS(df, gsub(".csv",".rds",paste0("trustName-config/ed","/",fname),))
  
  #file.remove(paste0("trustName-config/ed","/",fname))
}

for (fname in filesED){
  df <- read.csv(paste0("trustName-config/inpatient","/",fname)) #edit trust name
  saveRDS(df, gsub(".csv",".rds",paste0("trustName-config/inpatient","/",fname),))
  
  #file.remove(paste0("trustName-config/ed","/",fname))
}