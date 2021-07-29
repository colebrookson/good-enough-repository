# Workflow, Structure, & Styling

Using consistent practices for how to set up a repository, write code, and interface with other programs is a really useful and important component of having repositories that can be easily used by others. This set of guidelines is divided into sections and lays out how different components of the repository should be structured. 

## Making This Repo Reproducible

When thinking about making a repo reproducible, there are two different 'types' of reproducibility that are useful to consider for this particular example:

* Reproducibility for *yourself*
* Reproducibility for *others*



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


  
