########## 
##########
# This code pulls in the raw data, cleans and manipulates it, and sets the data
# up for analysis. 
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-02-18
##########
##########

# set-up =======================================================================

# libraries
library(here)
library(tidyverse)

# read in all data
env_data = read_csv(here( # note the here() function for relative path
  './data/environmental-data/temp_salinity.csv'))
traits = read_csv(here('./data/species-data/species_traits.csv'))
abundance = read_csv(here('./data/species-data/species_abundance.csv'))

# perform a join between traits and abundance ==================================
