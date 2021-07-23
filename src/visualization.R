########## 
##########
# This file reads in files, makes plots, saves plot
##########
##########
# AUTHOR: Cole B. Brookson
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================

using("here", "ggplot2", "readr")

# read in data
setosa_subset = read_csv(here('./output/setosa_subset_data.csv'))
new_data = read_csv(here('./output/new_data_for_prediction.csv'))

# plots =======================================================================

# make a simple figure
simple_fig = ggplot(data = setosa_subset) +
  geom_point(aes(x = Sepal.Length, y = Petal.Width)) +
  labs(x = "sepal length", y = "petal width") +
  theme_bw()

# save plot 
ggsave(here('./figs/simple_iris_fig.png'), simple_fig)

# plot prediction
prediction_plot = ggplot(data = new_data) +
  geom_line(aes(x = Petal.Length, y = prediction),
            size = 2, colour = 'red') +
  labs(x = "petal length", y = "sepal length prediction") +
  theme_bw()

# save plot
ggsave(here('./figs/prediction_plot_simple.png'), prediction_plot)
