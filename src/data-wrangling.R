########## 
##########
# This file pulls the iris data from the built in data set, subsets the 
# species, and writes a file to be used as "clean" data
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================

using("ggplot2", "readr", "here")
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
write_csv(setosa_subset, here('./output/setosa_subset_data.csv'))

