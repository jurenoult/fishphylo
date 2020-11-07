
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fishphylo

<!-- badges: start -->

<!-- badges: end -->

The goal of fishphylo is to import sequence data from GenBank and from
Fasta files and build basic phylogenetic trees.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jurenoult/fishphylo")
```

## Example 1: import sequences from GenBank

Load this project as a library:

``` r
library(fishphylo)
```

indicate taxa and the gene name

``` r
ls_tax_gen <- cb_taxa_gene(c("Buenia","Pomatoschistus adriaticus"),"COI")
#> ""
ls_tax_gen
#> [1] "(Buenia [Organism] OR Pomatoschistus adriaticus [Organism]) AND COI[Gene]"
```

write a fasta file

``` r
ls_fasta <-build_fasta(ls_tax_gen)
write_fasta(ls_fasta,"bueniaETpomadri_COI_seqs.fasta")
```
