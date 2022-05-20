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
# library(here) - if necessary

# data wrangling ===============================================================

# This script reads in iris data and performs some simple data wrangling, then 
# writes out the files needed for model fitting 

source('./src/data-wrangling.R')

# model fitting ================================================================

# This script reads in the appriate csvs and fits a shitty GLM, then makes a 
# model prediction on in and out of sample data

source('./src/model-fitting.R')

# model visualization ==========================================================

# this script reads in two dataframes and creates and saves simple plots 

source('./src/visualization.R')


