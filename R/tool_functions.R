#' Write fasta file in output directory
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



#' Read fasta file from output directory
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



#' Display accession number and species name of a fasta file
#'
#' @param file an object output by function read_fasta
#'
#' @return display a list of accessions with the index
#' @export
#' @import stringr
#'
#' @examples
disp_access <- function(file){
  if (sapply(strsplit(attr(file[[1]],"Annot"), " "), length) == 1) {end <- 1}
  else if (sapply(strsplit(attr(file[[1]],"Annot"), " "), length) == 2) {end <- 2}
  else {end <- 3}
  ls_access = ""
  for (i in 1:length(file)){
    access <- word(attr(file[[i]],"Annot"), 1,end, sep=" ")
    access <- str_remove(access,"[>]")
    ls_access=c(ls_access, paste0(i,": ", access ,"\n"))
  }
  cat(ls_access)
}


#' Read a fasta file and align the sequences
#'
#' @param file a fasta file located in the data folder
#'
#' @return a sequence alignment (msa)
#' @export
#'
#' @examples
align_fasta <- function(file){
  fas <- readDNAStringSet(here::here("data",file))
  fas_align <- msa(fas,"ClustalW",maxiters = 100) # align with ClustalW
  return(fas_align)
}


#' rename fasta object
#'
#' @param fasta_ls fasta object
#'
#' @return the same fasta object but with new names
#' @export
#'
#' @examples
fas_name <- function(fasta_ls){
  names = ""
  for (i in 1:length(fasta_ls)){
    if (sapply(strsplit(attr(fasta_ls[[i]],"Annot"), " "), length) == 1) {end <- 1}
    else if (sapply(strsplit(attr(fasta_ls[[i]],"Annot"), " "), length) == 2) {end <- 2}
    else {end <- 3}
    access <- word(attr(fasta_ls[[i]],"Annot"), 1 ,end, sep=" ")
    access <- str_remove(access,"[>]")
    names=c(names,access)
  }
return(names[-1])
}


