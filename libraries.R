# Packages
cran_packages <-  c("ggplot2", "gridExtra", "data.table", "xml2", "rvest", "stringr", "readr", "pander", "knitcitations", "knitr", "rmarkdown")
bioc_packages <- c("org.Hs.eg.db")

# Install if necessary:
# install.packages(cran_packages)
# source("https://bioconductor.org/biocLite.R")
# biocLite(bioc_packages)

# Load packages into session
sapply(c(cran_packages, bioc_packages), require, character.only = TRUE)

