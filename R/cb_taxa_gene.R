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


