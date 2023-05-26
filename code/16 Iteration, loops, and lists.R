library(rio) #import and export package
library(here) # File locator
library(tidyverse)

#Import the linelist
linelist <- import("raw_data/linelist_cleaned.rds")

for (num in c(1,2,3,4,5)) {
  print(num + 2)
}

#Make vector of the hospital names. Unique function is a function to remove the repeated name.
hospital_names <- unique(linelist$hospital)

# A for loop with character sequence
for (hosp in hospital_names) {
  
}

#Print a number of NA in every columns

for (col in colnames(linelist)) {
  print(sum(is.na(linelist[[col]])))
}

# Create container to store results - a character vector
cases_demographics <- vector(mode = "character", length = nrow(linelist))

for (i in 1:nrow(linelist)) {
  #Extract values from linelist for row i, using brackets for indexing
  row_gender <- linelist$gender[[i]]
  row_age    <- linelist$age_years[[i]]
  
  # Combine gender-age and store in container vector at indexed location
  cases_demographics[[i]] <- str_c(row_gender, row_age, sep = ",") #Join multiple character vector to a single character vector 
}
head(cases_demographics)