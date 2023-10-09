
#---Packages Used---------------------------------------------------------------

## IO operations
library(readxl)
library(stringr)

## Visualization
library(ggplot2)
#library(ggtree)
library(gggenomes) #devtools::install_github('thackl/gggenomes')
library(ggpubr)
library(ggridges)
library(viridis)
library(RColorBrewer)
library(colorspace)
library(cowplot)
library(gridExtra)
library(circlize)
library(extrafont)
#library(ComplexHeatmap)
library(ggbeeswarm) #devtools::install_github('eclarke/ggbeeswarm')
library(gghalves)

## Programming utility
library(reshape2)
library(tidyverse)
library(tidyr)
library(fuzzyjoin)
library(dplyr)
library(pheatmap)

## Ordination
library(vegan)
library(Rtsne)

## Statistical tests and correlation analysis
library(rstatix)
library(corrr)
library(compareGroups)
library(lsr)
library(cluster)
library(MuMIn)

## Machine learning & predictive moodelling
#library(Amelia)
#library(MASS)
#library(car)
#library(caTools)
#library(nlme)
#library(ggeffects)
#library(lme4)
#library(lmerTest)
#library(broom)
#library(broom.mixed)
#library(caret)

## Miscellaneous
library(kableExtra)
library(knitr)
library(labelled)
library(rmarkdown)
library(bookdown)




#---Global options for Markdown-------------------------------------------------

options(digits = 3)

knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    echo = FALSE,
    message = FALSE,
    warning = FALSE,
    cache = FALSE,
    #out.width = "80%",
    rows.print = 10,
    max.print = 1000,
    fig.align = "center",
    fig.width = 8,
    fig.asp = 0.618,
    fig.show = "hold"
)

# rootdir <- dirname(dirname(getwd()))

# knitr::opts_knit$set(root.dir = rootdir)
# knitr::opts_knit$set(width=75)

options(DT.options = list(
    pageLength = 5,
    dom = 'itlp', 
    scrollX=TRUE, 
    scrollY=TRUE, 
    font_size=10
))

options(dplyr.print_min = 6, dplyr.print_max = 6)


#---Source code and input files-------------------------------------------------

source("src/utilities.R")
source("src/pathotypeR_v2.R")

#source("https://raw.github.com/kevinsblake/PathotypeR/main/pathotype.R")

###---Load data-----------------------------------------------------------------

isolates.file <- "data/isolates/TD-TrEAT_isolates-01-data_KSB.xlsx"

e00.isolates.main <- read_excel(isolates.file, sheet="Tab-00_main", skip=1, na="NA")
e00.isolates.assembly <- read_excel(isolates.file, sheet="Tab-01_assembly", skip=1, na="NA")
e00.isolates.mlst <- read_csv("data/isolates/mlst/mlst_results.csv", na="NA", col_names=c("sample_seqID", "scheme", "ST", "adk",	"fumC",	"gyrB",	"icd",	"mdh",	"purA",	"recA"), show_col_types = FALSE)
e00.isolates.clonal <- read_excel(isolates.file, sheet="Tab_07-Ecoli_clonal", skip=1, na="NA")
e00.isolates.snpdists <- read_excel(isolates.file, sheet="Tab08_snp-dists", skip=1, na="NA")
e00.isolates.ast <- read_excel(isolates.file, sheet="Tab09_AST", skip=1, na="NA")

#tree <- ape::read.tree("data/isolates/fasttree/TrEAT-54_Cusco-189_ref-40_fasttree_core_genome_tree.newick")

#---Directory structure---------------------------------------------------------

cur.date <- format(Sys.Date(), "%y%m%d")

fln.prfx <- stringr::str_interp("${cur.date}")

main.dir <- file.path(getwd(), "reports")

## Provide the dir name to create under main dir:
out.path <- file.path(main.dir, fln.prfx)
fig.path <- file.path(out.path,"figures")
dat.path <- file.path(out.path, "data")

if (!dir.exists(out.path)){
    dir.create(out.path)
} else {
    print("output dir already exists!")
}

if (!dir.exists(fig.path)){
    dir.create(fig.path)
} else {
    print("figure dir already exists!")
}

if (!dir.exists(dat.path)){
    dir.create(dat.path)
} else {
    print("data dir already exists!")
}

