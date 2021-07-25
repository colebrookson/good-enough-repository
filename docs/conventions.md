# Workflow & Styling

Using consistent practices for how to set up a repository, write code, and interface with other programs is a really useful and important component of having repositories that can be easily used by others. This set of guidelines is divided into sections and lays out how different components of the repository should be structured. 

## Style Guide

This style guide is based largely off the [Tidyverse Style Guide](https://style.tidyverse.org/), and much of the style guidelines here are copied and pasted directly. This assumes you are using the [R](https://www.r-project.org/) language and likely the [RStudio](https://www.rstudio.com/) IDE. It is recommended that you read through and follow the [Tidyverse Style Guide](https://style.tidyverse.org/) but **there are five key components of the style guide, *Files, Syntax, Function, Pipes, `ggplot2`***, and key components of each are highlighted here: 

* **Files**
  * Organization
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
 * Internal Structure
   * Use commented lines of - and = to break up your file into easily readable chunks.
   ```
   # Load data ===========================

   # Plot data ===========================
   ```
   * If your script uses add-on packages, load them all at once at the very beginning of the file. This is more transparent than sprinkling library() calls throughout your code or having hidden dependencies that are loaded in a startup file, such as .Rprofile.

* Syntax
  * Object Names
   * Variable and function names should use only lowercase letters, numbers, and _. Use underscores (_) (so called snake case) to separate words within a name.
   * Base R uses dots in function names (`contrib.url()`) and class names (`data.frame`), but it’s better to reserve dots exclusively for the S3 object system. In S3, methods are given the name `function.class`; if you also use . in function and class names, you end up with confusing methods like `as.data.frame.data.frame()`
   * Where possible, avoid re-using names of common functions and variables. This will cause confusion for the readers of your code.
  * Long Lines
   * Strive to limit your code to 80 characters per line. This fits comfortably on a printed page with a reasonably sized font. If you find yourself running out of room, this is a good indication that you should encapsulate some of the work in a separate function.
   * If a function call is too long to fit on a single line, use one line each for the function name, each argument, and the closing ). This makes the code easier to read and to change later.
  ```
  # Good
  do_something_very_complicated(
   something = "that",
   requires = many,
   arguments = "some of which may be long"
  )
 
  # Bad
  do_something_very_complicated("that", requires, many, arguments,
                               "some of which may be long"
                               )
  ```
  * Comments
   * Each line of a comment should begin with the comment symbol and a single space: #
   * In data analysis code, use comments to record important findings and analysis decisions. If you need comments to explain what your code is doing, consider rewriting your code to be clearer. 

