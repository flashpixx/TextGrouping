source("dependency.r")

# Multi-dimensional scaling
# https://en.wikipedia.org/wiki/Multidimensional_scaling
# https://www.statmethods.net/advstats/mds.html
analysis.mds <- function( p_graph )
{
    common.dependencies("igraph")
    return( cmdscale( igraph::as_adj( p_graph, attr = "weight" ), eig=TRUE, k=2 ) )
}
