#' Build a ML tree
#'
#' @param fas_align  a fasta alignement output by align_fasta function (msa object)
#' @param output_name a string indicating the name of the .tre file saved in the output folder
#'
#' @return a tree object
#' @export
#' @import phangorn
#' @import stringr
#' @import ape
#'
#' @examples
build_MLtree <- function(fas_align,output_name){
  fas_align <- msaConvert(fas_align,"phangorn::phyDat") # convert the msa object as a phyDat object compatible with phangorn
  # rename accession names to keep only the accession number and species name (the first 3 word of the name attribute of a fasta sequence)
  dna_dist <- dist.ml(fas_align, model="JC69")
  pom_NJ  <- NJ(dna_dist)
  fit <- pml(pom_NJ, fas_align)
  fitJC <- optim.pml(fit, model = "JC", rearrangement = "stochastic",control = pml.control(trace=0))
  bs <- bootstrap.pml(fitJC, bs=500, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))
  tree <- plotBS(midpoint(fitJC$tree), bs, p = 50, "phylogram")
  write.tree(tree,"example.tree")
  return (tree)
}

