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
  
	start <- id[1]
	df <- data.frame("id", "nobs")
  for(indx in id) {
    poll_data <- read_csv(paste(directory, "/", formatC(indx, width = 3, flag = "0"), ".csv", sep = ""), 
                          col_names = TRUE, col_types = "Dddi")
    # Find fows with measurements for both sulfate and nitrate
    temp <- !is.na(poll_data$sulfate) & !is.na(poll_data$nitrate)
    df[indx-start+1,] = c(indx, sum(temp))
  } # end loop
	
	return(df)

} # end complete