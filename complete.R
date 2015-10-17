complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # Complete counts
  nobs = numeric()
  
  # Read all files
  files <- list.files(directory, full.names=TRUE)
  
  # Load a data frame with the data from each requested monitor
  # Count the number of complete cases (rows without NA)
  for (i in 1:length(id)) {
    dat <- read.csv(files[id[i]])
    nobs[i] <- nrow(dat[complete.cases(dat),])
  }
  
  data.frame(id, nobs)
}