########## 
##########
# This code creates the fake raw data that will be used as an example dataset
# for analysis. 
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2020-03-28
##########
##########

# set-up =======================================================================

library(here)
library(tidyverse)


# create species-level data ====================================================

# make up some list of species and sample w/ replacement from that list
species = sample(c('fish A', 'fish B', 'fish C', 'fish D', 'fish E',
                   'invert A', 'invert B', 'invert C', 'invert D'),
                 size = 200, 
                 replace = TRUE)

# make up list of regions and sample w/ replacement
regions = sample(c('south', 'north', 'west', 'east'),
                 size = 200, 
                 replace = TRUE)

# make up a series of years to go with the 
years = sample(c(2010:2015), 
               size = 200, 
               replace = TRUE)

# make up a series of abundances to pair to the other objects
abundance = sample(c(0:300),
                   size = 200,
                   replace = TRUE)

# bind the data into a dataframe
species_data = data.frame(species, regions, years, abundance)

#write the dataframe
write_csv(species_data, here('./data/species-data/species_abundance.csv'))



