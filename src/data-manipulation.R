###############
###############
# This file reads in some data, cleans it, and exports it ready for analysis
# in accordance with the results presented in Brookson et al. (2075)
###############
###############
# AUTHOR: Cole B. Brookson
# INSTANIATION DATE: 2021-05-13
###############
###############

# set-up =======================================================================

library(ggplot2); library(here); library(readr)

data = read_csv(here("./data/raw-data/offspring_data.csv"))


# writing functions ============================================================

# Naming Conventions

# 1. consistency
# objectOne -- Camel Case
# object_one -- snake case 


adding_sum = function(x, y) {
  
  ######### Docstring ################
  # function takes in two numeric parameters and returns their sum
  
  ##### PARAMETERS:
  # x [num] - an object of type numeric
  # y [num] - an object of type numeric
  
  ##### RETURNS:
  # z [num] - the sum of x & y 
  
  z = x + y 
  
  return(z)
} 

adding_sum(9, 15)

# writing files ================================================================

write_csv(data, here("./data/cleaned-data/cleaned_offspring_data.csv"))








