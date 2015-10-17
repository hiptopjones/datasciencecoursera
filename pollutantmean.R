pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  # Read all files
  files <- list.files(directory, full.names=TRUE)
  
  # Load a data frame with all of the data from all of the monitors
  dat <- data.frame()
  for (i in id) {
    dat <- rbind(dat, read.csv(files[i]))
  }
  
  # Calculate the mean of the pollutant over the requested monitors
  mean(dat[dat[, "ID"] %in% id, pollutant], na.rm = TRUE)
}