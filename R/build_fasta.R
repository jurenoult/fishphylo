#' build a fasta file
#'
#' Download sequences from Genbank and build a fasta file from an object output by cb_taxa_gene function
#' @param term output of cb_taxa_gene function, gives a list of taxon and the name of the gene
#' @param retmax max number of sequences to retain; default is 500
#' @param rettype format of the output; default is Fasta
#'
#' @return return a list of fasta sequences
#' @export
#' @importFrom rentrez entrez_search
#' @importFrom rentrez entrez_fetch
#'
#' @examples
#' pom <- cb_taxa_gene("Pomatoschistus adriaticus","COI")
#' seq_fasta <- build_fasta(pom)

build_fasta <- function (term, retmax=500,rettype="fasta"){
  temp <- entrez_search(db="nuccore", term=term,retmax=retmax)
  seq_fasta <- entrez_fetch(db="nuccore", id=temp$ids , rettype=rettype)
  return(seq_fasta)
}
