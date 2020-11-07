#' Build a ML tree
#'
#' @param fas_align  a fasta alignement output by align_fasta function (msa object)
#' @param output_name a string indicating the name of the .tre file saved in the output folder
#'
#' @return a tree object
#' @export
#' @import phangorn
#' @import stringr
#'
#' @examples
build_MLtree <- function(fas_align,output_name){
  fas_align <- msaConvert(fas_align,"phangorn::phyDat") # convert the msa object as a phyDat object compatible with phangorn
  # rename accession names to keep only the accession number and species name (the first 3 word of the name attribute of a fasta sequence)
  names <- attributes(fas_align)$names
  for (i in 1:length(names)){
    attributes(fas_align)$names[i] <- word(names[i], 1,3, sep=" ")
  }
  dna_dist <- dist.ml(fas_align, model="JC69")
  pom_NJ  <- NJ(dna_dist)
  fit <- pml(pom_NJ, fas_align)
  fitJC <- optim.pml(fit, model = "JC", rearrangement = "stochastic")
  bs <- bootstrap.pml(fitJC, bs=500, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))
  tree <- plotBS(midpoint(fitJC$tree), bs, p = 50, "phylogram")
  write.tree(tree,"example.tree")
  return (tree)
}

