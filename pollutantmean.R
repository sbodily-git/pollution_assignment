pollutantmean <- function(directory, pollutant, id=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID number
  ## to be used.
  
  ## Return the mean of the pollutant across all monitor list
  ## in the 'id' vector (ignoring NA values)
  ## Result is not rounded.

  the_data <- c()
  
  for (idx in id){
    poll_data <- read_csv(paste(directory, "/", formatC(idx, width = 3, flag = "0"), ".csv", sep = ""), 
                          col_names = TRUE, col_types = "Dddi")
    the_data <- c(the_data,
                  poll_data[pollutant][!is.na(poll_data[pollutant])])
  }
  mean(the_data)

  # id100_data <- read_csv("specdata/100.csv", col_names = TRUE, col_types = "Dddi")
  # id100_sulfate <- id100_data["sulfate"][!is.na(id100_data["sulfate"])]
  
} # end pollutantmean
