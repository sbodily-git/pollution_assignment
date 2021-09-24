corr <- function(directory, threshold = 0) {

	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
	
	## 'threshold' is a numeric vector of length 1 indicating the
	## number of completely observed observations (on all
	## variables) required to compute the correlation between
	## nitrate and sulfate; the default is 0
	
	## Return a numeric vector of correlations
	## NOTE: Do not round the result!
	
  comp_c <- complete("specdata")
  correlations <- c()
  
  for (index in comp_c$id) {
    if (comp_c$nobs[index] > threshold){
      poll_data <- read_csv(paste(directory, "/",
                                  formatC(index, width = 3, flag = "0"),
                                  ".csv", sep = ""), 
                            col_names = TRUE, col_types = "Dddi")
      # Find rows with measurements for both sulfate and nitrate
      temp <- !is.na(poll_data$sulfate) & !is.na(poll_data$nitrate)
      c_data <- poll_data[temp,][c("sulfate", "nitrate")]
      c_val <- cor(c_data)
      correlations <- c(correlations, c_val[2,1])
    } # end if
  } # end loop
  return(correlations)
  
} # end corr