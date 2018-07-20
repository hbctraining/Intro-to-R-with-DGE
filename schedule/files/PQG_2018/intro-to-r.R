# Intro to R lesson
# July 16th, 2018

# Interacting with R

## Adding 3 and 5
3 + 5

# Assignment operator
x <- 3

y <- 5
y

x + y

number <- x + y
number

## Exercises
x <- 5
y <- 10
number <- x + y

# Vectors
glengths <- c(4.6, 3000, 50000)
glengths

species <- c("ecoli", "human", "corn")
species

## Exercise
combined <- c(glengths, species)
combined

# Factor
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

expression <- factor(expression)
expression

## Exercise
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")

samplegroup <- factor(samplegroup)
samplegroup

# Data frames
df <- data.frame(species, glengths)
df

# Lists
list1 <- list(species, df, number)
list1

## Exercise
list2 <- list(species, glengths, number)
list2

# Functions
glengths
glengths <- c(glengths, 90)
glengths
glengths <- c(30, glengths)
glengths


sqrt(81)
sqrt(glengths)

round(3.14159)
?round
round(3.14159, digits=2)

args(round)
example("round")

round(3.14159, 2) #not recommended

# Exercise
mean(glengths)
?mean
glengths

# Creating a function
square_it <- function(x){
  square <- x*x
  return(square)
}

square_it(12)

square_it <- function(x)

square_it(12)

# Packages
sessionInfo()
search()

# CRAN
install.packages("ggplot2")
library(ggplot2)
sessionInfo()

help.search("scatter")

# Exercise: Install tidyverse
install.packages("tidyverse")
sessionInfo()

?read.csv

# Reading in data
metadata <- read.csv("data/mouse_exp_design.csv")

# Inspecting data
head(metadata)

str(metadata)

class(metadata)

class(glengths)

class(species)

summary(metadata)

summary(species)

length(species)

dim(metadata)

rownames(metadata)

# Subsetting with indices

age <- c(15, 22, 45, 52, 73, 81)
age

age[5]

age[-5]

age[c(3,5,6)]

idx <- c(3,5,6)
idx

age[idx]

age[1:4]

age[4:1]

## Exercises
alphabets <- c("C", "D", "X", "L", "F")
alphabets

bacon <- c(1,2,5)
alphabets[bacon]
alphabets[c(1,2,5)]

# Subsetting using logical operators
age

age > 50

idx <- age > 50 | age < 18
idx

age
age[idx]


idx <- which(age > 50 | age < 18)
idx

age[idx]

age2 <- age[which(age > 50 | age < 18)]

# Subsetting factors
expression

expression[expression == "high"]

idx <- expression == "high"
expression[idx]

## Exercise
samplegroup

idx <- which(samplegroup != "KO")
idx

samplegroup[idx]

# Releveling factors

expression <- factor(expression, levels = c("low", "medium", "high"))
expression

## Exercise

samplegroup <- factor(samplegroup, levels = c("KO", "CTL", "OE"))
samplegroup

### Subsetting data frames

metadata

metadata[1,1]
metadata[1,3]

metadata[3, ]

metadata[ ,3] ## returns a vector
metadata[ ,3,drop=FALSE] ## leaves output as data frame

metadata[ ,1:2]
# OR
metadata[ ,c(1,2)]

metadata[c(1,3,6), ]
# OR
idx <- c(1,3,6)
idx
metadata[idx, ]

rownames(metadata)

metadata[1:3, "celltype"]

metadata$genotype

metadata$genotype[1:5]

metadata[ , c("celltype","genotype")]

### subsetting with logical operators

idx <- metadata$celltype == "typeA"
idx
# OR
idx <- which(metadata$celltype == "typeA")
idx

metadata$celltype
idx

metadata[idx, ]

idx <- which(metadata$replicate > 1)
idx
metadata[idx,]

sub_meta <- metadata[idx,]

## exercise

idx <- which(metadata$genotype == "KO")
metadata[idx, ]
# OR
metadata[which(metadata$genotype == "KO"), ]

## Subsetting from lists

list1

list1[[2]]
class(list1[[2]])

list1[[1]]
list1[[1]][1]


### exercise

random <- list(metadata, age, list1, samplegroup, number)

random[[4]]

random[[1]]$celltype[8:12]
#OR
tail(random[[1]]$celltype, n=5)

##naming components of a list

names(list1)
names(list1) <- c("species", "df", "number")


names(list1)

list1

list1$df

list1$df[2,]

## Writing to file

write.csv(sub_meta, file = "data/subset_meta.csv")

glengths

write(glengths, file="data/genome_lengths.txt")
write(glengths, file="data/genome_lengths_ncol1.txt", ncolumns = 1)

# Matching and Reordering

rpkm_data <- read.csv("data/counts.rpkm.csv")
ncol(rpkm_data)
nrow(metadata)

A <- c(1,3,5,7,9,11)   # odd numbers
B <- c(2,4,6,8,10,12)  # even numbers

A %in% B

A <- c(1,3,5,7,9,11)   # odd numbers
B <- c(2,4,6,8,1,5)  # add some odd numbers in 

A %in% B

intersection <- A %in% B
intersection

A[intersection]

# Atleast one true
any(intersection)

# All true values
all(intersection)
all(A %in% B)
A == B
all(A == B)

# Exercise
A
B
B %in% A
B[B %in% A]
#OR
intersection <- B %in% A
B[intersection]

# Try on our data
rnames <- rownames(metadata)
cnames <- colnames(rpkm_data)

any(rnames %in% cnames)
all(rnames %in% cnames)
all(rnames == cnames)

# Exercise
important_genes <- c("ENSMUSG00000083700", "ENSMUSG00000080990", "ENSMUSG00000065619", "ENSMUSG00000047945", "ENSMUSG00000081010", 	"ENSMUSG00000030970")

# Q1
important_genes %in% rownames(rpkm_data)

# Q2
rnames_rpkm <- rownames(rpkm_data)
overlap <-which(rnames_rpkm %in% important_genes)

rpkm_data[overlap, ]
rpkm_data[important_genes,]

# Refresher Exercise

# 1. Extract the speed of 40 km/h.
animals$speed[1]
animals$speed[animals$speed == 40]
animals[1,1]
animals[1,"speed"]
animals["Elephant", "speed"]

# 2. Return the rows with color of Tan.
animals[c(2,5), ]
animals[which(animals$color == "Tan"), ]
animals[animals$color == "Tan",]

# 3. Return the rows with speed greater than 50 km/h and output only the color column. Keep the output as a data frame.

animals[animals$speed > 50, "color", drop =F]
animals[animals$speed > 50, 2, drop=F]
animals[which(animals$speed > 50), "color", drop =F]

# 4. Change the color of “Grey” to “Gray”.

animals$color != "Gray"
animals[animals$color != "Gray",]

animals[4,2] <- "Gray"
animals[animals$color == "Grey", 2] <- "Gray"
animals[animals$color == "Grey", "color"] <- "Gray"

rownames(df)[]

# Reordering values
teaching_team <- c("Mary", "Meeta", "Radhika")
teaching_team[c(2,3)]
teaching_team[c(3,2)]
teaching_team

reorder_teach <- teaching_team[c(3, 1, 2)]
reorder_teach

colnames(rpkm_data)
colnames(rpkm_data[ , c(12, 1, 9, 6, 2, 7, 3, 4, 5, 11, 10, 8)])

# Reordering using the match() function
first <- c("A","B","C","D","E")
second <- c("B","D","E","A","C")  # same letters but different order
second[c(4, 1, 5, 2, 3)]

match_idx <- match(first, second)
second[match_idx]

second[match(first, second)]

first <- c("A","B","C","D","E")
second <- c("D","B","A")  # remove values

second[match(first, second)]

# Reordering genomic data
rownames(metadata)
colnames(rpkm_data)

genomic_idx <- match(rownames(metadata), colnames(rpkm_data))

rpkm_ordered <- rpkm_data[ , genomic_idx]

all(rownames(metadata) == colnames(rpkm_ordered))

## Ggplot2


### Setting up a data frame for visualization

mean(rpkm_ordered[,"sample1"])

library(purrr)

samplemeans <- map_dbl(rpkm_ordered, mean)

samplemeans

new_metadata <- cbind(metadata, samplemeans)

age_in_days <- c(40, 32, 38, 35, 41, 32, 34, 26, 28, 28, 30, 32)    
# Create a numeric vector with ages. Note that there are 12 elements here.

new_metadata <- cbind(new_metadata, age_in_days)    
# add the new vector as the last column to the new_metadata dataframe

### Plotting!

library(ggplot2)

ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y = samplemeans, color = genotype, shape = celltype), size = 3.0) +
  theme_bw() +
  theme(axis.text = element_text(size=rel(1.5)), axis.title = element_text(size=rel(1.5))) +
  xlab("Age (days)") +
  ylab("Mean expression") +
  ggtitle("Scatter plot age vs samplemeans") +
  theme(plot.title=element_text(hjust=0.5))

## Creating a function for consistent formatting

personal_theme <- function(){
  theme_bw() +
    theme(axis.text=element_text(size=rel(1.5)),
          axis.title=element_text(size=rel(1.5)),
          plot.title=element_text(hjust=0.5))
  }


#### rerunning the scatterplot with new personal theme function

ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y = samplemeans, color = genotype, shape = celltype), size = 3.0) +
  xlab("Age (days)") +
  ylab("Mean expression") +
  ggtitle("Scatter plot age vs samplemeans") +
  personal_theme()

### Boxplot

ggplot(new_metadata) +
  geom_boxplot(aes(x=genotype,y=samplemeans, fill = celltype)) +
  ggtitle("Genotype differences in avg gene expression") +
  xlab("Genotype") +
  ylab("Mean expression") +
  personal_theme()

# Tidyverse

res_tableOE <-read.csv(file="data/Mov10oe_DE_results.csv", row.names = 1)
library(tidyverse)

# Pipes
round(sqrt(83), digits = 2)

sqrt(83) %>% 
  round(digits=2)

#Exercise
rep_number <- metadata$replicate

factor(rep_number) %>% 
  head(n=2)
##OR##
rep_number %>% 
  factor() %>% 
  head(n=2)

# Tibbbles

meta_tibble <- metadata %>% 
  rownames_to_column() %>% 
  as_tibble()

# Dplyr
class(res_tableOE)

res_tableOE <- res_tableOE %>% 
  rownames_to_column(var="gene") %>% 
  as_tibble()

# Select

res_tableOE %>% 
  select(gene, baseMean, log2FoldChange, padj)

# remove columns
res_tableOE %>% 
  select(-c(lfcSE, stat, pvalue))

sub_res <- res_tableOE %>% 
  select(-lfcSE, -stat, -pvalue)


# Arrange
sub_res %>% 
  arrange(padj)

# Filter
sub_res %>% 
  filter(baseMean > 0, padj < 0.01)

# OR

sub_res %>% 
  filter(baseMean > 0 & padj < 0.01)

# Mutate

sub_res %>% 
  mutate(log10BaseMean = log10(baseMean)) %>% 
  select(gene, baseMean, log10BaseMean)

sub_res %>%  
  rename(symbol = gene)

# Pull
sub_res %>% 
  pull(gene) %>% 
  head()

# Creating behavior dataframe

ID <- c(546, 983, 042, 952, 853, 061)
diet <- c("veg", "pes", "omni", "omni", "omni", "omni")
exercise <- c("high", "low", "low", "low", "med", "high")
behavior <- data.frame(ID, diet, exercise)

# Creating blood dataframe

ID <- c(983, 952, 704, 555, 853, 061, 042, 237, 145, 581, 249, 467, 841, 546)
blood_levels <- c(43543, 465, 4634, 94568, 134, 347, 2345, 5439, 850, 6840, 5483, 66452, 54371, 1347)
blood <- data.frame(ID, blood_levels)


inner_join(blood, behavior)
left_join(blood, behavior)
full_join(blood, behavior)



