# Gene-level differential expression analysis using DESeq2
## Setup
### Bioconductor and CRAN libraries used
library(tidyverse)
library(RColorBrewer)
library(DESeq2)
library(pheatmap)
library(DEGreport)

## Loading data
?read.table
data <- read.table("data/Mov10_full_counts.txt", header = T, row.names = 1)

meta <- read.table("meta/Mov10_full_meta.txt", header = T, row.names = 1)

class(data)
class(meta)

## Plot histogram of counts
ggplot(data) +
  geom_histogram(aes(x= Mov10_oe_1), stat = "bin", bins = 200) +
  xlab("Raw expression counts") +
  ylab("Number of genes")
ggplot(data) +
  
  geom_histogram(aes(x = Mov10_oe_1), stat = "bin", bins = 200) + 
  xlim(-5, 500)  +
  xlab("Raw expression counts") +
  ylab("Number of genes")

# Explore the mean-variance relationship
?apply
mean_counts <- apply(data[, 3:5], 1, mean)
variance_counts <- apply(data[, 3:5], 1, var)
df <- data.frame(mean_counts, variance_counts)

ggplot(df) +
  geom_point(aes(x=mean_counts, y=variance_counts)) + 
  geom_line(aes(x=mean_counts, y=mean_counts, color="red")) +
  scale_y_log10() +
  scale_x_log10()



### Creating a DEseqDataSet Object

#### checking if metadata rownames match counts data column names

# check if all are present
all(rownames(meta) %in% colnames(data))

# check if all are in same order
all(rownames(meta) == colnames(data))

#### creating dds

dds <- DESeqDataSetFromMatrix(countData = data, colData = meta, design = ~ sampletype)

View(counts(dds))

dds <- estimateSizeFactors(dds)

sizeFactors(dds)

normalized_counts <- counts(dds, normalized = TRUE)

write.table(normalized_counts, file="data/normalized_counts.txt", sep="\t", quote=F, col.names=NA)

# Quality Control
rld <- rlog(dds, blind=TRUE)
class(rld)
?plotPCA

plotPCA(rld, intgroup="sampletype")
library(pheatmap)

# Heatmap
rld_mat <- assay(rld)
rld_cor <- cor(rld_mat)
pheatmap(rld_cor)

example("pheatmap")
?brewer.pal
display.brewer.all()

# DESeq2 analysis

## Create DESeq object
dds <- DESeqDataSetFromMatrix(countData = data, colData = meta, design = ~ sampletype)

## Run analysis
dds <- DESeq(dds)

## Check size factors
sizeFactors(dds)

## Total number of raw counts per sample
colSums(counts(dds))

## Total number of normalized counts per sample
colSums(counts(dds, normalized=T))

## Seeking help with DESeq2 vignette
vignette("DESeq2")

## Plot dispersion estimates
plotDispEsts(dds)

# Building Results
?results

## Define contrasts, extract results table, and shrink the log2 fold changes

contrast_oe <- c("sampletype", "MOV10_overexpression", "control")

# unshrunken
res_tableOE_unshrunken <- results(dds, contrast=contrast_oe, alpha = 0.05)

library(tidyverse)
data.frame(res_tableOE_unshrunken) %>% View()

# shrink FC
res_tableOE <- lfcShrink(dds, contrast=contrast_oe, res=res_tableOE_unshrunken)
data.frame(res_tableOE) %>% View()

# MA plot
plotMA(res_tableOE_unshrunken, ylim=c(-2,2))
mcols(res_tableOE)


## Define contrasts, extract results table and shrink log2 fold changes
contrast_kd <-  c("sampletype", "MOV10_knockdown", "control")

res_tableKD <- results(dds, contrast=contrast_kd, alpha = 0.05)

res_tableKD <- lfcShrink(dds, contrast=contrast_kd, res=res_tableKD)

summary(res_tableOE, alpha= 0.001)

### Set thresholds
padj.cutoff <- 0.05
lfc.cutoff <- 0.58

res_tableOE_tb <- res_tableOE %>% 
  data.frame() %>% 
  rownames_to_column(var="gene") %>% 
  as_tibble()

res_tableOE_tb

sigOE <- res_tableOE_tb %>% 
  filter(padj < padj.cutoff & abs(log2FoldChange) > lfc.cutoff) 

sigOE

res_tableKD_tb <- res_tableKD %>%
  data.frame() %>%
  rownames_to_column(var="gene") %>% 
  as_tibble()

sigKD <- res_tableKD_tb %>%
  filter(padj < padj.cutoff & abs(log2FoldChange) > lfc.cutoff)

## Visualizing results

# load libraries
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(DEGreport)
library(RColorBrewer)
library(DESeq2)
library(pheatmap)

# Create tibbles including row names
mov10_meta <- meta %>% 
  rownames_to_column(var="samplename") %>% 
  as_tibble()

normalized_counts <- normalized_counts %>% 
  data.frame() %>%
  rownames_to_column(var="gene") %>% 
  as_tibble()

#### plotting a single gene with DESeq2's plotCounts()


plotCounts(dds, gene = "MOV10", intgroup = "sampletype")

d <- plotCounts(dds, gene = "MOV10", intgroup = "sampletype", returnData = TRUE)

ggplot(d, aes(x = sampletype, y = count, color = sampletype)) + 
  geom_point(position=position_jitter(w = 0.1,h = 0)) +
  geom_text_repel(aes(label = rownames(d))) + 
  theme_bw() +
  ggtitle("MOV10") +
  theme(plot.title = element_text(hjust = 0.5))
# OR
# ggplot(d) + 
#   geom_point(aes(x = sampletype, y = count, color = sampletype)position=position_jitter(w = 0.1,h = 0)) +
#   geom_text_repel(aes(x = sampletype, y = count, color = sampletype, label = rownames(d))) + 
#   theme_bw() +
#   ggtitle("MOV10") +
#   theme(plot.title = element_text(hjust = 0.5))

### plotting counts of multiple genes

top20_sigOE_genes <- res_tableOE_tb %>% 
  arrange(padj) %>% 	#Arrange rows by padj values
  pull(gene) %>% 		#Extract character vector of ordered genes
  .[1:20] 		#Extract the first 20 genes

normalized_counts

## normalized counts for top 20 significant genes
top20_sigOE_norm <- normalized_counts %>%
  filter(gene %in% top20_sigOE_genes)

# Gathering the columns to have normalized counts to a single column
gathered_top20_sigOE <- top20_sigOE_norm %>%
  gather(colnames(top20_sigOE_norm)[2:9], key = "samplename", value = "normalized_counts")

gathered_top20_sigOE <- inner_join(mov10_meta, gathered_top20_sigOE)

## plot using ggplot2
ggplot(gathered_top20_sigOE) +
  geom_point(aes(x = gene, y = normalized_counts, color = sampletype)) +
  scale_y_log10() +
  xlab("Genes") +
  ylab("log10 Normalized Counts") +
  ggtitle("Top 20 Significant DE Genes") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(plot.title = element_text(hjust = 0.5))

### Heatmap of expression

### Extract normalized expression for significant genes from the OE and control samples (4:9), and set the gene column (1) to row names
norm_OEsig <- normalized_counts[,c(1,4:9)] %>% 
  filter(gene %in% sigOE$gene) %>% 
  data.frame() %>%
  column_to_rownames(var = "gene") 


### Annotate our heatmap (optional)
annotation <- mov10_meta %>% 
  select(samplename, sampletype) %>% 
  data.frame(row.names = "samplename")

### Set a color palette
heat_colors <- brewer.pal(6, "YlOrRd")


### Run pheatmap
pheatmap(norm_OEsig, 
         color = heat_colors, # provide a vector of colors
         cluster_rows = T, 
         show_rownames = F,
         annotation = annotation, # provide a data.frame with 1 or more columns
         border_color = NA, 
         fontsize = 10, 
         # scale = "row", 
         fontsize_row = 10, 
         height = 20)


## Obtain logical vector where TRUE values denote padj values < 0.05 and fold change > 1.5 in either direction

res_tableOE_tb <- res_tableOE_tb %>% 
  mutate(threshold_OE = padj < 0.001 & abs(log2FoldChange) >= 0.58)


## Volcano plot
ggplot(res_tableOE_tb) +
  geom_point(aes(x = log2FoldChange, y = -log10(padj), colour = threshold_OE)) +
  ggtitle("Mov10 overexpression") +
  xlab("log2 fold change") + 
  ylab("-log10 adjusted p-value") +
  #scale_y_continuous(limits = c(0,50)) +
  theme(legend.position = "none",
        plot.title = element_text(size = rel(1.5), hjust = 0.5),
        axis.title = element_text(size = rel(1.25))) 


## volcano plot (labeled)

## Create a column to indicate which genes to label
res_tableOE_tb <- res_tableOE_tb %>% arrange(padj) %>% mutate(genelabels = "")
res_tableOE_tb$genelabels[1:10] <- res_tableOE_tb$gene[1:10]

ggplot(res_tableOE_tb) +
  geom_point(aes(x = log2FoldChange, 
                 y = -log10(padj),
                 colour = threshold_OE)) +
  geom_text_repel(aes(x = log2FoldChange, 
                      y = -log10(padj), 
                      label = genelabels)) +
  ggtitle("Mov10 overexpression") +
  xlab("log2 fold change") + 
  ylab("-log10 adjusted p-value") +
  theme(legend.position = "none",
        plot.title = element_text(size = rel(1.5), hjust = 0.5),
        axis.title = element_text(size = rel(1.25))) 

# OR

# ggplot(res_tableOE_tb, aes(x = log2FoldChange, y = -log10(padj))) +
#   geom_point(aes(colour = threshold_OE)) +
#   geom_text_repel(aes(label = genelabels)) +
#   ggtitle("Mov10 overexpression") +
#   xlab("log2 fold change") + 
#   ylab("-log10 adjusted p-value") +
#   theme(legend.position = "none",
#         plot.title = element_text(size = rel(1.5), hjust = 0.5),
#         axis.title = element_text(size = rel(1.25))) 


# Likelihood Ratio Test

# Likelihood ratio test
dds_lrt <- DESeq(dds, test="LRT", reduced = ~ 1)
res_LRT <- results(dds_lrt)

res_LRT %>% data.frame() %>% View()

summary(res_LRT, alpha=0.05)

# Subset the LRT results to return genes with padj < 0.05
sig_res_LRT <- res_LRT %>%
  data.frame() %>%
  rownames_to_column(var="gene") %>% 
  as_tibble() %>% 
  filter(padj < padj.cutoff)

sigLRT_genes <- sig_res_LRT %>% 
  pull(gene)

## Clustering of LRT genes
# Subset results for faster cluster finding (for classroom demo purposes)
clustering_sig_genes <- sig_res_LRT %>%
  arrange(padj) %>%
  head(n=1000)

clustering_sig_genes

# Obtain rlog values for those significant genes
cluster_rlog <- rld_mat[clustering_sig_genes$gene, ]

# Use the `degPatterns` function from the 'DEGreport' package to show gene clusters across sample groups
clusters <- degPatterns(cluster_rlog, metadata = meta, time = "sampletype", col=NULL)

class(clusters)
names(clusters)

clusters$df %>%  
  filter(cluster ==1)
