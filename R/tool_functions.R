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
  write (fasta_ls,here::here("data",name),sep="\n")
}

#' read fasta file from output directory
#'
#' @param file .fas file located in the data directory
#' @param name name of output file
#'
#' @return an object reading fasta sequences
#' @export
#' @import here
#' @import seqinr
#'
#' @examples
#' fas_file <- read_fasta("bueniaETpomadri_COI_seqs.fasta")
read_fasta <- function(name){
  read.fasta(here::here("data",name), as.string = TRUE)
}


#' display accession number and species name of a fasta file
#'
#' @param file an object output by function read_fasta
#'
#' @return display a list of accessions with the index
#' @export
#' @import stringr
#'
#' @examples
disp_access <- function(file){
  ls_access = ""
  for (i in 1:length(file)){
    access <- str_remove(word(attr(file[[i]],"Annot"), 1,3, sep=" "),"[>]")
    ls_access=c(ls_access, paste0(i,": ", access ,"\n"))
  }
  cat(ls_access)
}


