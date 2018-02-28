# Intro to R Lesson
# Feb 26th, 2018

# Interacting with R

## I am adding some numbers. R is fun!

3 + 5

# Assignment operator

x <- 3

y <- 5

y

x + y

number <- x + y

## Exercises

x <- 5
x

y <- 10

number <- x + y

# Vectors

glenths <- c(4.6, 3000, 50000)

#rm(glenths)

species <- c("ecoli", "human", "corn")
species

## Exercise

combined <- c(glengths, species)
combined

# Factors

## First create a vector
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

## Turn into factor
expression <- factor(expression)
expression

## Exercise
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")

samplegroup <- factor(samplegroup)
samplegroup

# Data frame

df <- data.frame(species, glengths)
df

# List

list1 <- list(species, df, number)
list1

## Exercise

list2 <- list(species, glengths, number)
list2

# Functions
glengths
glengths <- c(glengths, 90)
glengths
glengths <- c(60, glengths)
glengths

sqrt(81)
sqrt(glengths)

round(3.14159)
round(3.14159, digits=2)
round(3.14159, 2)

?round
args(round)
example(round)

# Exercise
mean(glengths, na.rm=TRUE)

## Packages
sessionInfo()
search()

# install.packages("ggplot2")
# library(ggplot2)
# search()
# sessionInfo()
# 
# source("http://bioconductor.org/biocLite.R")
# biocLite("ggplot2")
# 
# help.search("scatter")

## Reading in the metadata csv file

metadata <- read.csv(file="data/mouse_exp_design.csv")

metadata

## exploring ways to look at data in objects

head(metadata)
tail(metadata)

str(metadata)

class(metadata)
class(glengths)

summary(metadata)

length(glengths)

length(expression)

dim(metadata)

nrow(metadata)

ncol(metadata)

rownames(metadata)

colnames(metadata)

## Using indices to subset from vectors

age <- c(15, 22, 45, 52, 73, 81)

age[4]

age[-5]

idx <- c(3,5,6)
age[idx]
OR
age[c(3,5,6)] # nested function

age[2:6]

age[6:2]

# exercise

alphabets <- c("C", "D", "X", "L", "F")

alphabets[c(1,2,5)]

alphabets[-3]

alphabets[5:1]

## Logical expression for subsetting

age

age > 50

age > 50 | age < 18

idx <- age > 50 | age < 18
age[idx]
OR
age[age > 50 | age < 18]

age[which(age > 50 | age < 18)]

## Factors, data subsetting

expression

expression[expression == "high"]

samplegroup

samplegroup[samplegroup != "KO"]

## releveling

str(expression)

expression[expression > "low"]

# reordering
expression <- factor(expression, ordered = T)

str(expression)  

expression[expression > "low"]

# releveling

expression <- factor(expression, levels = c("low","medium","high"))

str(expression)  

expression[expression > "low"]


samplegroup

# exercise

samplegroup <- factor(samplegroup, ordered = T)
str(samplegroup)

samplegroup <- factor(samplegroup, levels = c("KO", "CTL", "OE"))
str(samplegroup)

OR

samplegroup <- factor(samplegroup, levels = c("KO", "CTL", "OE"), ordered = T)
str(samplegroup)

# Data wrangling: Part II

metadata[1,1]
metadata[3,1]
metadata[3,]
metadata[,3]

metadata[1:3,]
metadata[,1:2]

metadata[c(1,3,6),]
OR
idx <- c(1,3,6)
metadata[idx,]

metadata[1:3,"celltype"]

metadata$genotype
class(metadata$genotype)
metadata$genotype[1:3]
colnames(metadata)

metadata[,c("genotype", "celltype")]
metadata[1:3,]
metadata[c("sample1", "sample5", "sample10"),]

# Logical vectors
idx <- metadata$celltype == "typeA"
idx
metadata[idx,]
OR
metadata[metadata$celltype == "typeA",]

idx <- which(metadata$celltype == "typeA") 
idx
metadata[idx,]

idx <- which(metadata$replicate > 1)
idx
metadata[idx,]

# Exercise
metadata[metadata$genotype == "KO",]
metadata[which(metadata$genotype == "KO"),]

# Subset function
subset(metadata, celltype == "typeA")
subset(metadata, celltype == "typeA" & genotype == "Wt")
subset(metadata, celltype == "typeA" | genotype == "Wt")

subset(metadata, replicate < 3, select=c("genotype","celltype"))

# Exercise

subset(metadata, genotype == "Wt")
subset(metadata, genotype == "KO", celltype)

# Lists
list1
list1[[2]]

list1[[1]][1]
list1[[2]][,"glengths"]

# Exercise
## Create a list called random
random <- list(metadata, age, list1, samplegroup, number)
random

## Print out values stored in samplegroup
random[[4]]

## Extract celltype from metadata component
random[[1]][,"celltype"]

### Select only the last five values from celltype column

random[[1]][8:12,"celltype"]

names(list1) <-c("species", "df", "number")
names(list1)

list1$df
list1[["df"]]
list1[[2]]

# Exercise
## Set names for random list
random <- list(metadata, age, list1, samplegroup, number)
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
names(random)

## Extract the third component of the age vector from random
random[["age"]][3]
random[[2]][3]

## extract genotype information from metadata
random[[1]][,"genotype"]
random$metadata[,"genotype"]
random[["metadata"]][,"genotype"]

sub_meta <- subset(metadata, genotype == "KO")
write.csv(sub_meta, file="data/subset_meta.csv", quote = FALSE)

# Matching

## Reading in data

rpkm_data <- read.csv("data/counts.rpkm.csv")

nrow(metadata)
ncol(rpkm_data)

## %in% operator
A <- c(1,3,5,7,9,11)   # odd numbers
B <- c(2,4,6,8,10,12)  # even numbers

A %in% B

## %in% operator
A <- c(1,3,5,7,9,11)   # odd numbers
B <- c(2,4,6,8,1,5)  # even numbers

intersection <- A %in% B
intersection

A[intersection]

any(A %in% B)

all(A %in% B)

## Exercise

B %in% A

B[B %in% A]

## Checking for same order of values (==)
A <- c(10,20,30,40,50)
B <- c(50,40,30,20,10)  # same numbers but backwards

A %in% B

A == B

all(A == B)

x <- rownames(metadata)
y <- colnames(rpkm_data)

all(x %in% y)
all(rownames(metadata) %in% colnames(rpkm_data))

all(rownames(metadata) == colnames(rpkm_data))

## Exercise
important_genes <- c("ENSMUSG00000083700", "ENSMUSG00000080990", "ENSMUSG00000065619", "ENSMUSG00000047945", "ENSMUSG00000081010", 	"ENSMUSG00000030970")

all(important_genes %in% rownames(rpkm_data))

idx <- rownames(rpkm_data) %in% important_genes

important_counts <- rpkm_data[idx, ]

rpkm_data[important_genes, ]

# Reordering

teaching_team <- c("Mary", "Meeta", "Radhika")

teaching_team[c(2,3)]
teaching_team

teaching_team[c(3,2)]

reorder_teach <- teaching_team[c(3, 1, 2)]
reorder_teach

## Exercise

# Creating behavior dataframe

ID <- c(546, 983, 042, 952, 853, 061)
diet <- c("veg", "pes", "omni", "omni", "omni", "omni")
exercise <- c("high", "low", "low", "low", "med", "high")
behavior <- data.frame(ID, diet, exercise)

# Creating blood dataframe

ID <- c(983, 952, 704, 555, 853, 061, 042, 237, 145, 581, 249, 467, 841, 546)
blood_levels <- c(43543, 465, 4634, 94568, 134, 347, 2345, 5439, 850, 6840, 5483, 66452, 54371, 1347)
blood <- data.frame(ID, blood_levels)

all(blood$ID %in% behavior$ID)

## Extract IDs in blood that are also in behavior
blood$ID %in% behavior$ID

blood[blood$ID %in% behavior$ID, 1]

## Extract IDs in blood that are not in behavior
blood$ID %in% behavior$ID == FALSE
!(blood$ID %in% behavior$ID)

blood[blood$ID %in% behavior$ID == FALSE, 1]
blood[!(blood$ID %in% behavior$ID), 1]

## return rows where blood ID is present in behavior

blood <- blood[blood$ID %in% behavior$ID, ]

blood_reordered <- blood[c(6, 1, 5, 2, 3, 4), ]

all(blood_reordered$ID == behavior$ID)

blood_behavior <- data.frame(blood_reordered, behavior)

blood_behavior <- blood_behavior[, -3]

# match() function

first <- c("A","B","C","D","E")
second <- c("B","D","E","A","C")  # same letters but different order
second[c(4, 1, 5, 2, 3)]

idx <- match(first, second)
second[idx]

first <- c("A","B","C","D","E")
second <- c("D","B","A")  # remove values

idx <- match(first, second)
second[idx]

# Reordering genomic data
rownames(metadata)

colnames(rpkm_data)

genomic_idx <- match(rownames(metadata), colnames(rpkm_data))
genomic_idx

head(rpkm_data[, genomic_idx])

rpkm_ordered <- rpkm_data[, genomic_idx]

all(rownames(metadata) == colnames(rpkm_ordered))

# Data Visualization
mean(rpkm_data[,"sample1"])
mean(rpkm_data[,"sample2"])

samplemeans <- apply(rpkm_ordered, 2, mean)
samplemeans

new_metadata <- cbind(metadata, samplemeans)
class(new_metadata)
age_in_days <- c(40, 32, 38, 35, 41, 32, 34, 26, 28, 28, 30, 32)    
# Create a numeric vector with ages. Note that there are 12 elements here.
age_in_days
new_metadata <- cbind(new_metadata, age_in_days)

library(ggplot2)
sessionInfo()
search()

## scatterplot
ggplot(new_metadata) +
  geom_point(aes(x=age_in_days, y=samplemeans, color=genotype, shape=celltype), size=3.0) +
  theme_bw() +
  theme(axis.text = element_text(size=rel(1.5)),
        axis.title = element_text(size = rel(1.5)))

example("geom_point")

# Exercise
ggplot(new_metadata) +
  geom_point(aes(x=age_in_days, y=samplemeans, color=genotype, shape=celltype), size=3.0) +
  theme_bw() +
  theme(axis.text = element_text(size=rel(1.5)),
        axis.title = element_text(size = rel(1.5))) +
  xlab("Age(days)") +
  ylab("Mean expression") + 
  ggtitle("Expression changes with age") +
  theme(plot.title=element_text(hjust=0.5))

# Histogram
ggplot(new_metadata) +
  geom_histogram(aes(x=samplemeans), stat ="bin", binwidth = 0.8)

ggplot(new_metadata) +
  geom_histogram(aes(x=samplemeans), bins=8)

# Boxlot
ggplot(new_metadata) +
  geom_boxplot(aes(x=genotype, y=samplemeans, fill=celltype)) +
  ggtitle("Boxplot of average expression") +
  xlab("Genotype") +
  ylab("Mean expression") +
  theme(plot.title=element_text(hjust=0.5, size=rel(1.25))) +
  theme(axis.title = element_text(size=rel(1.5)),
        axis.text = element_text(size=rel(1.25)))


pdf("figures/scatterplot.pdf")
ggplot(new_metadata) +
  geom_point(aes(x=age_in_days, y=samplemeans, color=genotype, shape=celltype), size=3.0) +
  theme_bw() +
  theme(axis.text = element_text(size=rel(1.5)),
        axis.title = element_text(size = rel(1.5))) +
  xlab("Age(days)") +
  ylab("Mean expression") + 
  ggtitle("Expression changes with age") +
  theme(plot.title=element_text(hjust=0.5))

dev.off()
