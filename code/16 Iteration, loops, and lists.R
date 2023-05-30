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

# Create a containers
# Empty vector
delays <-
  vector(mode = "double",
         length = length(unique(linelist$hospital)))

# Empty data frame
delays1 <-
  data.frame(matrix(ncol = 2, nrow = 3))

# Empty list
plots <-
  vector(mode = "list", length = 16)

# Printing
for (hosp in hospital_names) {
  hospital_cases <- linelist %>% filter(hospital == hosp)
  print(nrow(hospital_cases))
}

# Looping plots
# create 'incidence' object
outbreak <- incidence2::incidence(   
  x = linelist,                   # dataframe - complete linelist
  date_index = date_onset,        # date column
  interval = "week",              # aggregate counts weekly
  groups = gender,                # group values by gender
  na_as_group = TRUE)             # missing gender is own group

# plot epi curve
plot(outbreak,                       # name of incidence object
     fill = "gender",                # color bars by gender
     color = "black",                # outline color of bars
     title = "Outbreak of ALL cases" # title
)
