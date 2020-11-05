
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fishphylo

<!-- badges: start -->

<!-- badges: end -->

The goal of fishphylo is to import sequence data from GenBank and from
Fasta files et construct phylogenetic trees

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jurenoult/fishphylo")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(fishphylo)
## basic example code
fishphylo::cb_taxa_gene(c("Gobius","Pomatoschistus"),"COI")
#> ""
#> [1] "(Gobius [Organism] OR Pomatoschistus [Organism]) AND COI[Gene]"
```
