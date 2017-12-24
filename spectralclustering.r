source( "dependency.r", local = attach( NULL ) )

# https://jangorecki.gitlab.io/data.table/library/kernlab/html/specc.html
# http://kokkodis.blogspot.de/2013/02/spectral-clustering-with-eigengap.html
# https://www.r-bloggers.com/k-means-clustering-in-r/
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/kmeans.html
# http://igraph.org/r/doc/laplacian_matrix.html
# https://cran.r-project.org/web/packages/matlib/vignettes/eigen-ex1.html
analysis.spectralclustering <- function( p_graph )
{
    common.dependencies("igraph", "zoo")

    l_spectral <- igraph::embed_laplacian_matrix( p_graph, no = igraph::vcount( p_graph ) - 1 )
    l_eigengap = zoo::rollapply( l_spectral$D, 2,  function(x) { return(x[1]-x[2]) })

    #l_laplacian <- igraph::laplacian_matrix( p_graph, normalized = TRUE );
    #l_eigen <- eigen( l_laplacian )

    l_clusternumber <- length( l_eigengap ) - nnet::which.is.max( l_eigengap );
    print(l_clusternumber)
}
