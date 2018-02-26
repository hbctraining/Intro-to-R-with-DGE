# Practice with R
## Creating vectors/factors and dataframes
1. We are performing RNA-Seq on cancer samples being treated with three different types of treatment (A, B, and P). You have 12 samples total, with 4 replicates per treatment. Write the R code you would use to construct your metadata table as described below.  
 - Create the vectors/factors for each column (Hint: you can type out each vector/factor, or if you want the process go faster try exploring the rep() function).
 - Put them together into a dataframe called `meta`.
 - Use the rownames() function to assign row names to the dataframe (Hint: you can type out the row names as a vector, or if you want the process go faster try exploring the paste() function).

 Your finished metadata table should have information for the variables "sex", "stage", "treatment", and "myc" levels: 

 | |sex	| stage	| treatment	| myc |
 |:--:|:--: | :--:	| :------:	| :--: |
 |sample1|	M	|I	|A	|2343|
 |sample2|	F	|II	|A	|457|
 |sample3	|M	|II	|A	|4593|
 |sample4	|F	|I	|A	|9035|
 |sample5|	M	|II	|B	|3450|
 |sample6|	F|	II|	B|	3524|
 |sample7|	M|	I|	B|	958|
 |sample8|	F|	II|	B|	1053|
 |sample9|	M|	II|	P|	8674|
 |sample10	|F|	I	|P	|3424|
 |sample11|	M	|II	|P	|463|
 |sample12|	F|	II|	P|	5105|

 
## Subsetting vectors/factors and dataframes
 7. Using the metadata table from question #6, write out the R code you would use to perform the following operations (questions DO NOT build upon each other):
a. return only the "treatment" and "sex" columns:
b. return the "treatment" values for samples 5, 7, 9, and 10:
c. use subset() to return all data for those samples receiving treatment "P":
d. use subset() to return only the "stage" and "treatment" data for those samples with "myc" > 5000:
e. remove the "treatment" column from the dataset:
f.  remove samples 7, 8 and 9 from the dataset:
g. keep only samples 1-6:
h. add a column called "pre_treatment" to the beginning of the dataframe with the values T, F, F, F, T, T, F, T, F, F, T, T (Hint: use cbind()): 
i. change the names of the columns to: "A", "B", "C", "D":
 
## Lists
8. Create a new list, "list2" with three components, the "glengths" vector, the dataframe "df", and "number" value. Use this list to answer the questions below . "list2" has the following structure (NOTE: the components of this list are not currently named):
[[1]]
[1]   4.6  3000.0 50000.0 
 
[[2]]
     species glengths
1   ecoli       4.6
2   human   3000.0
3   corn       50000.0
 
[[3]]
[1] 8

Write out the R code you would use to perform the following operations (questions DO NOT build upon each other):
a. return the second component of the list:
b. return "50000.0" from the first component of the list:
c. return the value "human" from the second component: 
d. give the components of the list the following names: "genome_lengths", "genomes", "record". Then return "record":

