complete <- function(directory, id = 1:332) {
	## 'directory' is a charaacter vector of length 1 indicating
	## the location of the csv files
	
	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used.
	
	## Return a data frame of the form:
	## id nobs
	## 1  117
	## 2  1047
	## ...
	## where 'id' is the monitor ID number and 'nobs' is the
	## number of complete cases.
  
  lp <- id
  id <- c()
  nobs <- c()
  for(idx in lp) {
    poll_data <- read_csv(paste(directory, "/", formatC(idx, width = 3, flag = "0"), ".csv", sep = ""), 
                          col_names = TRUE, col_types = "Dddi")
    # Find rows with measurements for both sulfate and nitrate
    temp <- !is.na(poll_data$sulfate) & !is.na(poll_data$nitrate)

    id <- c(id, idx)
    nobs <- c(nobs, sum(temp))

  } # end loop
	
  data.frame(id, nobs)
  
} # end complete