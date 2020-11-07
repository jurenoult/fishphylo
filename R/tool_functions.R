#' write fasta file in output directory
#'
#' @param fasta_ls list of fasta sequence produced by build_fasta function
#' @param name name of output file
#'
#' @return write a file with .fasta extension
#' @export
#' @import here
#'
#' @examples
#' ls_tax_gen <- cb_taxa_gene("Pomatoschistus adriaticus","COI")
#' ls_fasta <-build_fasta(ls_tax_gen)
#' write_fasta(ls_fasta, "pomadri_COI_seqs.fasta")
#'
write_fasta <- function(fasta_ls,name = "fasta_seq"){
  write (fasta_ls,here::here("output",name),sep="\n")
}
