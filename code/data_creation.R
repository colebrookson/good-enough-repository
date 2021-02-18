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


# create species-level abundance data ==========================================

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
species_abundance = data.frame(species, regions, years, abundance)

# write the abundance dataframe
write_csv(species_abundance, 
          here('./data/species-data/species_abundance.csv')
          #note the use of the here() function to use the relative path
          #name and thus allow this to work on others' personal set-ups
          )

# create species-level trait data ==============================================

# create some random trait values for body size, habitat, and thermal optimum
# for each species
species_names = c('fish A', 'fish B', 'fish C', 'fish D', 'fish E',
                  'invert A', 'invert B', 'invert C', 'invert D')
body_size = c(100, 121, 34, 29, 93, 
              0.13, 1.09, 2.15, 0.67)
habitat_type = c('nearshore', 'offshore', 'nearshore', 'nearshore', 'offshore',
                 'offshore', 'offshore', 'nearshore', 'nearshore')
thermal_optimum = c(15.6, 15.9, 16.1, 14.9, 15.1, 
                    13.9, 14.7, 16.2, 15.2)

# bind all values into a dataframe
species_traits = data.frame(species_names, body_size, habitat_type, 
                            thermal_optimum)

# write the traits dataframe
write_csv(species_traits, here('./data/species-data/species_traits.csv'))

