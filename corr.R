corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  # Find monitor station IDs with a number of complete observations over a threshold
  completecases <- complete(directory)
  id = completecases[completecases[,"nobs"] > threshold, "id"]
  
  # Read all files
  files <- list.files(directory, full.names=TRUE)
  
  # Create an empty vector
  correlations = numeric()
  
  if (length(id) > 1)
  {
    # Load a data frame with the data from each requested monitor
    # Count the number of complete cases (rows without NA)
    for (i in 1:length(id)) {
      dat <- read.csv(files[id[i]])
      dat_complete <- dat[complete.cases(dat), ]
      correlations[i] = cor(dat_complete[, "sulfate"], dat_complete[, "nitrate"])
    }
  }
  
  correlations
}