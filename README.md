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

### Contents

#### Introduction to R
| Lessons            | Estimated duration |
|:------------------------|:----------|
|[Introduction to R and RStudio](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/01_introR-R-and-RStudio.md) | 40 min |
|[Syntax and data structures](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/02_introR-syntax-and-data-structures.md) | 80 min |
|[Functions and arguments](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/03_introR-functions-and-arguments.md) | 45 min |
|[Data wrangling: subsetting vectors and factors](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/04_introR-data-wrangling.md) | 65 min |
|[Data wrangling: subsetting data frames, matrices and lists](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/05_introR-data-wrangling2.md) | 75 min |
|[Matching and reordering](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/06_advR-matching.md) | 90 min |
|[Data visualization with ggplot2](https://github.com/hbctraining/Intro-to-R/blob/master/lessons/07_ggplot2.md) | 60 min |

#### Differential Gene Expression (DGE) using RNA-seq raw counts data
| Lessons            | Estimated duration |
|:------------------------|:----------|
|[Setting up and DGE overview](lessons/10_DGE_setup_and_overview.md) | 70 min |
|[Introduction to count normalization](lessons/11_DGE_count_normalization.md) | 60 min |
|[QC using principal component analysis (PCA) and heirarchical clustering](lessons/12_DGE_QC_analysis.md) | 90 min |
|[Getting started with DESeq2](lessons/13_DGE_DESeq2_analysis.md) | 70 min |
|[Pairwise comparisons with DEseq2](lessons/14_DGE_DESeq2_analysis2.md) | 45 min |
|[Visualization of DGE analysis results](lessons/15_DGE_visualizing_results.md) | 45 min |
|[Summary of DGE workflow](https://github.com/hbctraining/Intro-to-R-with-DGE/blob/master/lessons/16_DGE_workflow_summary.md) | 15 min |
|[Complex designs with DESeq2 (LRT)](lessons/16_DGE_LRT.md) | 60 min |
|[BiomaRt and Ensembl](lessons/17_Ensembl_biomart.md) | 30 min |
|[Functional Analysis](lessons/18_functional_analysis.md) | 85 min |

***

*These materials have been developed by members of the teaching team at the [Harvard Chan Bioinformatics Core (HBC)](http://bioinformatics.sph.harvard.edu/). These are open access materials distributed under the terms of the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*

* *Some materials used in these lessons were derived from work that is Copyright © Data Carpentry (http://datacarpentry.org/). 
All Data Carpentry instructional material is made available under the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0).*
