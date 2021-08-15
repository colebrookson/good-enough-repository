# How to Make a ~~Perfect~~ Good Enough Repository for Reproducible Ecological Research

Launch this repo here: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/colebrookson/good-enough-repository/HEAD)

## What Is This Repository? 

This is an example repository that demonstrates how to simply structure what might be thought of as a 'typical' code base and repository for an ecological research project that comprises a scientific analysis to maximize reproducibility and ease-of-use for others, while minimizing the number of tools and products used to produce the result. 

While some of the components of this repository will stay constant through the use of different programming languages and/or IDEs (Integrated Development Environment), I have demo'd this particular repo for use with the programming language [R](https://www.r-project.org/about.html), being run through the [RStudio](https://www.rstudio.com/) IDE. I also assume that this repo will be organized and edited via git. **PLEASE NOTE:** All the data stored in this repository is from the [Iris dataset](https://en.wikipedia.org/wiki/Iris_flower_data_set) and has been used for demonstration purposes only.

## Who Is This Repository For? 

This repo is meant for folks who are working on some sort of research project they want to make reproducilbe. They are familiar with R/RStudio, can use Git, and that's about it. Everything else will be explained!

## A quick guide to the components of this repo

These are the main components of this repository that I think are essential to allowing for a simple, reproducbile repo that serves the needs
of you and your colleagues while you are actively working on it, and then subsequently serves the needs of other scientists after you complete your analysis and the repository is stable and mostly unchanging. 

You'll find more information about each of these components in the `/docs` folder in the root of this repo. Refer to those for the specific use of each of these components and why they're there. 

* The structure of the repo
* A `__main__.R` file
* RProject & the `here` package
* Code habits in each code file

## How to use this guide

Please feel free to use this repository as a base structure to base your own off of!

This repository is part set of documents that describe how to organize these types of projects, and part example repository that can be cloned/forked and edited to suit. If you want to use this repository, I suggest starting by cloning the repo and then reading the `/docs` folder, where explanations are included for all the important things in this repository. 
