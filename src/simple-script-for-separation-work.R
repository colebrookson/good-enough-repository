########## 
##########
# This code contains a one-script example for a reproducibility example
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================

library(tidyverse)
library(here)
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

# make and save a simple plot
simple_fig = ggplot(data = setosa_subset) +
  geom_point(aes(x = Sepal.Length, y = Petal.Width)) +
  labs(x = "sepal length", y = "petal width") +
  theme_bw()
ggsave(here('./figs/simple_iris_fig.png'), simple_fig)

# further subset data
setosa_subset = setosa_subset[which(setosa_subset$Petal.Width > 0.2), ]


# run a simple model
hist(setosa_subset$Sepal.Length)

# setosa_model = glm(Sepal.Length ~ Petal.Width*Petal.Length, 
#                    data = setosa_subset)
# 
# summary(setosa_model)
saveRDS(setosa_model, here('./output/setosa_model_object.rds'))

# read in rds and plot results
setosa_model = readRDS(here('./output/setosa_model_object.rds'))

# model prediction
new_data = data.frame(Petal.Length = seq(1.3, 1.9, 0.1),
                      Petal.Width = seq(0.3, 0.9, 0.1))
new_data$prediction = predict(setosa_model, new_data, type = "response")

# plot prediction
prediction_plot = ggplot(data = new_data) +
  geom_line(aes(x = Petal.Length, y = prediction),
            size = 2, colour = 'red') +
  labs(x = "petal length", y = "sepal length prediction") +
  theme_bw()
ggsave(here('./figs/prediction_plot_simple.png'), prediction_plot)
