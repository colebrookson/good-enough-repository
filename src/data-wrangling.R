########## 
##########
# This main file calls and runs all subsequent R files in this analysis
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================

library(ggplot2)
library(readr)
data = iris

# make function to subset by species 
species_subset = function(data, species) {
  
  # this function takes in a dataframe and the species name and returns 
  # the subset of that dataframe with only that species
  
  # PARAMETERS
  
  # data [dataframe] - Iris dataset
  # species [str] - string of species name
  
  # RETURN
  
  #subset_data [dataframe] - a subset of data
  
  subset = data[which(data$Species == species),]
  
  return(subset)
}

setosa_subset = species_subset(data, "setosa")

# write out setosa_subset
write_csv(setosa_subset, './output/setosa_subset_data.csv')

