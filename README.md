## Introduction to R and differential gene expression (DGE) analysis

| Audience | Computational Skills | Prerequisites | Duration |
:----------|:----------|:----------|:----------|
| Biologists | Beginner/Intermediate | None | 3-day workshop (~19.5 hours of trainer-led time)|

### Description
This repository has teaching materials for a **3-day**, hands-on **Introduction to R and differential gene expression (DGE) analysis** workshop. The workshop will introduce participants to the basics of R and RStudio and their application to differential gene expression analysis on RNA-seq count data.

R is a simple programming environment that enables the effective handling of data, while providing excellent graphical support. RStudio is a tool that provides a user-friendly environment for working with R. Together, R and RStudio allow participants to wrangle data, plot, and use DESeq2 to obtain lists of differentially expressed genes from RNA-seq count data.

This workshop is intended to provide both basic R programming knowledge AND its application. Participants should be interested in:

- using R for increasing their efficiency for data analysis
- visualizing data using R (ggplot2)
- using R to perform statistical analysis on RNA-seq count data to obtain differentially expressed gene lists

### Learning Objectives

- **R syntax:** Understanding the different 'parts of speech' in R; introducing variables and functions, demonstrating how functions work, and modifying arguments for specific use cases.
- **Data structures in R:** Getting a handle on the classes of data structures and the types of data used by R.
- **Data inspection and wrangling:** Reading in data from files. Using indices and various functions to subset, merge, and create datasets.
- **Visualizing data:** Visualizing data using plotting functions in base R as well as from external packages such as ggplot2.
- **Exporting data and graphics:** Generating new data tables and plots for use outside of the R environment.
- **Differential expression analysis for RNA-seq data:**
  - QC on count data
  - Using DESeq2 to obtain a list of significantly different genes
  - Visualizing expression patterns of differentially expressed genes
  - Performing functional analysis on gene lists with R-based tools

> These materials are developed for a trainer-led workshop, but also amenable to self-guided learning.

### Schedule

[Click here](https://hbctraining.github.io/Intro-to-R-with-DGE/schedule/) for the schedule.

### Contents

#### Introduction to R

| Lessons            | Estimated duration |
|:------------------------|:----------|
|[Introduction to R and RStudio](https://hbctraining.github.io/Intro-to-R/lessons/01_introR-R-and-RStudio.html) | 40 min |
|[Syntax and data structures](https://hbctraining.github.io/Intro-to-R/lessons/02_introR-syntax-and-data-structures.html) | 80 min |
|[Functions and arguments](https://hbctraining.github.io/Intro-to-R/lessons/03_introR-functions-and-arguments.html) | 45 min |
|[Data wrangling: subsetting vectors and factors](https://hbctraining.github.io/Intro-to-R/lessons/04_introR-data-wrangling.html) | 65 min |
|[Data wrangling: subsetting data frames, matrices and lists](https://hbctraining.github.io/Intro-to-R/lessons/05_introR-data-wrangling2.html) | 75 min |
|[Matching and reordering](https://hbctraining.github.io/Intro-to-R/lessons/06_advR-matching.html) | 90 min |
|[Introduction to Tidyverse](https://hbctraining.github.io/Intro-to-R/lessons/07_intro_tidyverse.html) | 60 min |
|[Data visualization with ggplot2](https://hbctraining.github.io/Intro-to-R/lessons/08_ggplot2.html) | 60 min |

#### Differential Gene Expression (DGE) using RNA-seq raw counts data

| Lessons            | Estimated duration |
|:------------------------|:----------|
|[Setting up and DGE overview](https://hbctraining.github.io/DGE_workshop/lessons/01_DGE_setup_and_overview.html) | 70 min |
|[Introduction to count normalization](https://hbctraining.github.io/DGE_workshop/lessons/02_DGE_count_normalization.html) | 60 min |
|[QC using principal component analysis (PCA) and heirarchical clustering](https://hbctraining.github.io/DGE_workshop/lessons/03_DGE_QC_analysis.html) | 90 min |
|[Getting started with DESeq2](https://hbctraining.github.io/DGE_workshop/lessons/04_DGE_DESeq2_analysis.html) | 70 min |
|[Pairwise comparisons with DEseq2](https://hbctraining.github.io/DGE_workshop/lessons/05_DGE_DESeq2_analysis2.html) | 45 min |
|[Visualization of DGE analysis results](https://hbctraining.github.io/Intro-to-R-with-DGE/lessons/B1_DGE_visualizing_results.html) | 45 min |
|[Summary of DGE workflow](https://hbctraining.github.io/DGE_workshop/lessons/07_DGE_summarizing_workflow.html) | 15 min |
|[Complex designs with DESeq2 (LRT)](https://hbctraining.github.io/DGE_workshop/lessons/08_DGE_LRT.html) | 30 min |
|[Functional Analysis](https://hbctraining.github.io/DGE_workshop/lessons/10_functional_analysis.html) | 85 min |

***

### [Installation Requirements](installation-requirements)

Download the most recent versions of R and RStudio for your laptop:

 - [R](http://lib.stat.cmu.edu/R/CRAN/) 
 - [RStudio](https://www.rstudio.com/products/rstudio/download/#download)
 
Note:  When installing the following packages, if you are asked to select (a/s/n) or (y/n), please select “a” or "y" as applicable.

(1) Install the below packages on your laptop from CRAN. You DO NOT have to go to the CRAN webpage; you can use the following function to install them one by one:

```r
install.packages("insert_package_name_in_quotations")
install.packages("insert_package_name_in_quotations")
& so on ...
```

Note that these package names are case sensitive!

```r
RColorBrewer
pheatmap
ggrepel
devtools
cowplot
```

(2) Install the below packages from Bioconductor. Run the `source()` function once, followed by the `biocLite()` function 9 times for the 9 packages:

```r
source("http://bioconductor.org/biocLite.R") 
biocLite("insert_first_package_name_in_quotations")
biocLite("insert_second_package_name_in_quotations")
& so on ...
```

Note that these package names are case sensitive!

```r
DESeq2
clusterProfiler
DOSE
org.Hs.eg.db
pathview
DEGreport
rhdf5
tximport
```

(3) Use a new method of installation from GitHub to install the below packages using the following code:

```r
devtools::install_github("insert_package_name_in_quotations")
```

```r
stephenturner/annotables
pachterlab/sleuth
COMBINE-lab/wasabi
```

(4) Finally, please check that all the packages were installed successfully by loading them one at a time using the library() function.  

```r
library(DESeq2)
library(ggplot2)
library(RColorBrewer)
library(pheatmap)
library(ggrepel)
library(cowplot)
library(clusterProfiler)
library(DEGreport)
library(org.Hs.eg.db)
library(DOSE)
library(pathview)
library(purrr)
library(rhdf5)
library(tximport)
library(annotables)
library(wasabi)
library(sleuth)
```

(5) Once all packages have been loaded, run sessionInfo().  

```r
sessionInfo()
```

### Practical exercises
After completion of the workshop, practice of concepts can be explored with [these exercises](https://hbctraining.github.io/DGE_workshop/exercises/DGE_analysis_exercises.html). An answer key is [available](https://hbctraining.github.io/DGE_workshop/exercises/DGE_analysis_exercises%20answer_key.html) to check answers.

****


***

*These materials have been developed by members of the teaching team at the [Harvard Chan Bioinformatics Core (HBC)](http://bioinformatics.sph.harvard.edu/). These are open access materials distributed under the terms of the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*

* *Some materials used in these lessons were derived from work that is Copyright © Data Carpentry (http://datacarpentry.org/). 
All Data Carpentry instructional material is made available under the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0).*
