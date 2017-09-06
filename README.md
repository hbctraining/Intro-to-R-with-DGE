---
Audience: Biologists
Computational Skills: Beginner/Intermediate
Prerequisites: None
Duration: 3-day workshop (~19.5 hours of trainer-led time)
---

## Introduction to R and differential gene expression (DGE) analysis

### Description
This repository has teaching materials for a **3-day**, hands-on **Introduction to R and differential gene expression (DGE) analysis** workshop. The workshop will introduce participants to the basics of R and RStudio and their application to differential gene expression analysis on RNA-seq count data.

R is a simple programming environment that enables the effective handling of data, while providing excellent graphical support. RStudio is a tool that provides a user-friendly environment for working with R. Together, R and RStudio allow participants to wrangle data, plot, and use DESeq2 to obtain lists of differentially expressed genes from RNA-seq count data.

This workshop is intended to provide both basic R programming knowledge AND its application. Participants should be interested in:

- using R for increasing their efficiency for data analysis
- visualizing data using R (ggplot2)
- using R to perform statistical analysis on RNA-seq count data to obtain differentially expressed gene lists

These materials will address the following:

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

### Contents

#### Introduction to R
| Lessons            | Duration |
|:------------------------|:----------|
|[Introduction to R and RStudio](lessons/01_introR-R-and-RStudio.md) | 40 min |
|[Syntax and data structures](lessons/02_introR-syntax-and-data-structures.md) | 80 min |
|[Functions and arguments](lessons/03_introR-functions-and-arguments.md) | 25 min |
|[Introduction to packages and finding help](lessons/04_introR-packages-and-libraries.md) | 25 min |
|[Data wrangling: subsetting vectors and factors](lessons/05_introR-data-manipulation.md) | 65 min |
|[Data wrangling: subsetting data frames, matrices and lists)](lessons/06_introR-data-manipulation2.md) | 75 min |
|[Nested functions](lessons/07_introR-nested-functions.md) | 30 min |
|[Matching and reordering](lessons/08_advR-matching.md) | 45 min |
|[Data visualization with ggplot2](lessons/09_Rdata_visualization.md) |  |

#### Differential Gene Expression (DGE) using RNA-seq raw counts data
| Lessons            | Duration |
|:------------------------|:----------|
|[Setting up and DGE overview](lessons/10_DGE_setup_and_overview.md) | 70 min |
|[Introduction to count normalization](lessons/11_DGE_count_normalization.md) | 50 min |
|[QC using principal component analysis (PCA) and heirarchical clustering](lessons/12_DGE_QC_analysis.md) | 85 min |
|[Getting started with DESeq2](lessons/13_DGE_DESeq2_analysis.md) | 30 min |
|[DEseq2 (contd.)](lessons/14_DGE_DESeq2_analysis2.md) |  |
|[Visualization of DGE analysis results](lessons/15_DGE_visualizing_results.md) | |
|[DESeq2 and LRT](lessons/16_DGE_LRT.md) |  |
|[BiomaRt and Ensembl](lessons/17_Ensembl_biomart.md) | |
|[Functional Analysis](lessons/18_functional_analysis.md) | |

***

*These materials have been developed by members of the teaching team at the [Harvard Chan Bioinformatics Core (HBC)](http://bioinformatics.sph.harvard.edu/). These are open access materials distributed under the terms of the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*

* *Some materials used in these lessons were derived from work that is Copyright © Data Carpentry (http://datacarpentry.org/). 
All Data Carpentry instructional material is made available under the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0).*
