# Workflow & Styling

Using consistent practices for how to set up a repository, write code, and interface with other programs is a really useful and important component of having repositories that can be easily used by others. This set of guidelines is divided into sections and lays out how different components of the repository should be structured. 

## Repo Structure

Every repo should follow the same basic structure for consistency and ease of use - both by collaborators and others wishing to reproduce analyses. At the root of each repo should, at a minumum, be the following: 

* Informative `README.md` file
* A `__main__.R` file
* Set of folders for structure
* [Binder](https://mybinder.org/) launch abilities, which requires*:
  * An `install.R` file
  * A `runtime.txt` file
  * A binder badge in the `README.md`
* A `.gitignore` file
* An `.RProj` for the whole repository

Additionally, it is beneficial in addition to (or instead of, depending on the project), include the following files which allow for the repo to be dockerized:
* A `Dockerfile` file
* A `docker-compose.yml` file 

Each of these items are described in more detail below. 

### `README.md` file

A `README.md` file is incredibly important as it acts as a type of landing page for your repository. That is, when folks come to your repository for the first time, this is the first thing they will see. As such, there's some key content that should be included. Here is a (far from exhaustive) list of things that could be included in a `README.md` file:

* **A brief description of the project the repo belongs to.** If the repo is being used to house the analysis for a papre, for example, a quick description of what the paper is about, and where to find the paper itself. Ideally, this is done through a link to the pre-print or published work. 
* **A brief description of what is *in* the repo.** List the contents of the repo very briefly. If the repo contains data and code, simply state that. 
* **A [binder](https://mybinder.org/)badge.** Using binder is a great way to ensure that anyone who wants to reproduce your analysis can do so without worrying about matching the dependencies of their personal machine with those in the repository. 
* **A repository DOI.** Every repository should have a DOI attached if it represents a finished analysis, as that is (ideally) how the analysis can be cited in the published paper, allowing anyone reading the paper to easily find the repo. 
* **Contact info.** List the name and contact info for whoever is responsible for maintaining the repo.

### `__main__.R` file

A `__main__.R` file is one (not the only, but one) way of ensuring ease of use for you, your collaborators, and any others trying to reproduce your code. The point of a `__main__.R` file is to call all the other files (kept in the `src` folder) and run them sequentially such that all the results can be produced simply by sourcing the `__main__.R` file. The example main file in this repository shows one option of structuring such a `__main__.R` file. 

### Folder structure

#### `src`

This is where all your code lives! Short for "source", `src` is the convential name for the location of all the "source code" for a particular project. I recommend against making sub-folders as it simply complicates the paths to each file. See the style guide below on structuring and naming files. 

#### `data` 

While GitHub is **not** a good long-term storage location for data, it can be useful to store smaller data files (e.g. csv files less than 1GB) on GitHub, to centralize the location of all materials needed for your analysis. In this case, unlike the `src` folder, it can sometimes to useful to separate those folders into `raw-data` and `cleaned-data` folders, that way scripts that read in raw data, can clean and export those data to a separate file, ready to be read into a separate script for analysis. It also makes it easier to know what files to look for if you're new to the repo. 

#### `docs`

This folder contains all the relevant documentation for your repository. This is a good place to store things like pseudocode, documents outlining decisions regarding methods, supplementary information about sampling protocols, metadata, etc. 

#### `figs`

While this folder may not always be necessary, it can be useful to have a folder dedicated to storing the figures associated with your results etc. 

#### `output`

Often, when we run large models, we end up with large objects that we don't necessarily want to have to re-run to get every time we re-start a working session to, say, play with some plots. Similarly, if someone just wants to see how you summarized the output of your model, they might not necessarily want to run the model itself if it might take some considerable time. Therefore, we can save our intermediate objects (often model objects) as `.RDS` objects, which are easily written and read from and into `R`. Store those objects (and the like) in this folder. 

## Style Guide

This style guide is based largely off the [Tidyverse Style Guide](https://style.tidyverse.org/), and much of the style guidelines here are copied and pasted directly. This assumes you are using the [R](https://www.r-project.org/) language and likely the [RStudio](https://www.rstudio.com/) IDE. It is recommended that you read through and follow the [Tidyverse Style Guide](https://style.tidyverse.org/) but **there are five key components of the style guide, *Files, Syntax, Functions, Pipes, `ggplot2`***, and key components of each are highlighted here: 

### **Files**
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

### **Syntax**
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

### **Functions**
  * Naming
    * As well as following the general advice for object names, strive to use verbs for function names:
    ```
    # Good
    add_row()
    permute()
    
    # Bad
    row_adder()
    permutation()
    ```
  * Long lines
    * If a function definition runs over multiple lines, indent the second line to where the definition starts.
    ```
    # Good
    long_function_name <- function(a = "a long argument",
                                   b = "another argument",
                                   c = "another long argument") {
      # As usual code is indented by two spaces.
    }
  
    # Bad
    long_function_name <- function(a = "a long argument",
      b = "another argument",
      c = "another long argument") {
      # Here it's hard to spot where the definition ends and the
      # code begins
    }
    ```
  * Comments
    * In code, use comments to explain the “why” not the “what” or “how”. Each line of a comment should begin with the comment symbol and a single space: #.
    ```
    # Good

    # Objects like data frames are treated as leaves
    x <- map_if(x, is_bare_list, recurse)
    
    # Bad
    
    # Recurse only with bare lists
    x <- map_if(x, is_bare_list, recurse)
    ``` 
### **Pipes**
  * Long Lines 
    *  If the arguments to a function don’t all fit on one line, put each argument on its own line and indent:
    ```
    iris %>%
     group_by(Species) %>%
     summarise(
       Sepal.Length = mean(Sepal.Length),
       Sepal.Width = mean(Sepal.Width),
       Species = n_distinct(Species)
     )
    ```
### **`ggplot2`**
   * Whitespace
     * `+` should always have a space before it, and should be followed by a new line. This is true even if your plot has only two layers. After the first step, each line should be indented by two spaces
   * Long lines
     * If the arguments to a ggplot2 layer don’t all fit on one line, put each argument on its own line and indent:
     ```
     # Good
     ggplot(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
       geom_point() +
       labs(
         x = "Sepal width, in cm",
         y = "Sepal length, in cm",
         title = "Sepal length vs. width of irises"
       ) 
     
     # Bad
     ggplot(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
       geom_point() +
       labs(x = "Sepal width, in cm", y = "Sepal length, in cm", title = "Sepal length vs. width of irises") 
     ```
     * ggplot2 allows you to do data manipulation, such as filtering or slicing, within the data argument. Avoid this, and instead do the data manipulation in a pipeline before starting plotting.
     ```
     # Good
     iris %>%
       filter(Species == "setosa") %>%
       ggplot(aes(x = Sepal.Width, y = Sepal.Length)) +
       geom_point()
     
     # Bad
     ggplot(filter(iris, Species == "setosa"), aes(x = Sepal.Width, y = Sepal.Length)) +
       geom_point()
     ```
  
