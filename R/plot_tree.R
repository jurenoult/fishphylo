
#' plot a phylogenetic tree
#'
#' @param tree object output by build_NJtree function
#'
#' @return plot a tree
#' @export
#'
#' @examples
plot_tree <- function(tree){
  plot(tree, type = "phylogram", use.edge.length = FALSE,
       node.pos = NULL, show.tip.label = TRUE, show.node.label = FALSE,
       edge.color = "black", edge.width = 0.5, edge.lty = 1, font = 2,
       cex = 0.3, adj = NULL, srt = 0, no.margin = FALSE,
       root.edge = FALSE, label.offset = 0.002, underscore = FALSE,
       direction = "rightwards",
       plot = TRUE,
       rotate.tree = 0, open.angle = 0, node.depth = 1,
       align.tip.label = FALSE)

  edgelab <- tree$node.label
  edgelab <- edgelab[edgelab>70]

  edgelabels(edgelab, adj = c(0.5, -0.25), frame = "none", cex = 0.3,
             col = "black", horiz = FALSE,
             width = NULL, height = NULL)
}
