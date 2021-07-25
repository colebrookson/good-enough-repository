# Workflow & Styling

Using consistent practices for how to set up a repository, write code, and interface with other programs is a really useful and important component of having repositories that can be easily used by others. This set of guidelines is divided into sections and lays out how different components of the repository should be structured. 

## Style Guide

This style guide is based largely off the [Tidyverse Style Guide](https://style.tidyverse.org/), and much of the style guidelines here are copied and pasted directly. This assumes you are using the [R](https://www.r-project.org/) language and likely the [RStudio](https://www.rstudio.com/) IDE. It is recommended that you read through and follow the [Tidyverse Style Guide](https://style.tidyverse.org/) but there are a few key points that are highlighted here: 

* Files
  * Internal Structure
    * File names should be meaningful and end in .R. Avoid using special characters in file names - stick with numbers, letters, -, and _.
    * If files should be run in a particular order, prefix them with numbers. If it seems likely you’ll have more than 10 files, left pad with zero:
    ```
    00_download.R
    01_explore.R
    ...
    09_model.R
    10_visualize.R
    ```
    * Pay attention to capitalization, since you, or some of your collaborators, might be using an operating system with a case-insensitive file system (e.g., Microsoft Windows or OS X) which can lead to problems with (case-sensitive) revision control systems. Prefer file names that are all lower case, and never have names that differ only in their capitalization.

