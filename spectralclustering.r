source("dependency.r")

# https://jangorecki.gitlab.io/data.table/library/kernlab/html/specc.html
# http://kokkodis.blogspot.de/2013/02/spectral-clustering-with-eigengap.html
# https://www.r-bloggers.com/k-means-clustering-in-r/
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/kmeans.html
# http://igraph.org/r/doc/laplacian_matrix.html
# https://cran.r-project.org/web/packages/matlib/vignettes/eigen-ex1.html
analysis.spectralclustering <- function( p_graph )
{
    common.dependencies("igraph", "zoo")

    l_laplacian <- igraph::laplacian_matrix( p_graph, normalized = TRUE );
    l_eigen <- eigen( l_laplacian )

    assign("dist", igraph::as_adj( p_graph, attr = "weight" ), envir = globalenv())
    assign("eig", l_eigen, envir = globalenv())
    assign("graph", p_graph, envir = globalenv())
    assign("laplacian", l_laplacian, envir = globalenv())

    l_clusternumber <- length( l_eigen$values) - nnet::which.is.max(  zoo::rollapply( l_eigen$values, 2,  function(x) { return(x[1]-x[2]) }) );
    print(l_clusternumber)
}
