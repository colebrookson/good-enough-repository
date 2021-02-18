########## 
##########
# This central R files successively sources all the R files needed to run a  
# full set of analysis, and details the use of each 
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-02-18
##########
##########

# How to Run This Code =========================================================

# This file will run all the code needed to reproduce the analysis presented in
# this repository. There are a number of ways to fully reproduce this 
# analysis. 

# The simplest way to reproduce this analysis and inspect the results is to 
# clone this open-access repository to your local machine, open this file,
# '__main__.R' and click the 'Source' button. Please note that if you do it this
# way you will have to check yourself to see that you have the right packages
# etc. 

# Create the data =============================================================
library(here)
source(here('./code/data_creation.R'))

# This script creates a series of *fake* data to be used for the purposes of 
# demonstration throughout this repository structure. Please note these data
# are completely contrived. 

# Clean the data for analysis ==================================================
rm(list = ls()) # clear environment to reduce memory overlaod
source(here('./code/data_cleaning.R'))

# This script takes the data that were processed in the previous script and 
# does some cleaning to ensure all four datasets (primary vs. secondary trait 
# classification and abundance v. presence/absence) are consistent and ready
# to be used in the multivariate analyses 