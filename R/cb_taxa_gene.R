#' Concatenate taxa names and gene name to build a search term for entrez_search function
#'
#' takes one or multiple taxa namzs, concatenate them and with the name of the gene build a search term for entrez_search function
#' @param tax a char vector, use c() for multiple names
#' @param gene a char vector, currently accepts a single gene
#'
#' @return the search term that feeds the entrez_search function
#'
#' @export
#'
#' @examples
#' cb_taxa_gene(c("Pomatoschistus","Gobius"),"COI")
#'
#'
cb_taxa_gene <- function(tax,gene){
  temp <- paste (tax[1]," [Organism]",sep="")
  if (length(tax) > 1){
    i=2
    while (i <= length(tax)){
      temp <- paste (temp," OR ",tax[i]," [Organism]",sep="")
      i<-i+1}
  }

  temp <- paste(cat("\""),"(",temp,") AND ",gene,"[Gene]",cat("\""),sep="")

  return(temp)
}


