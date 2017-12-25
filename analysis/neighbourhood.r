source( "common/dependency.r", local = TRUE )
source( "analysis/ncd.r", local = TRUE )
source( "analysis/mds.r", local = TRUE )
source( "analysis/spectralclustering.r", local = TRUE )

build.neighbourhood <- function( inputfile, stopwordlanguage = "english" )
{
    common.dependencies( "tm", "SnowballC", "igraph" )

    # read csv file (first column name, second column keywords)
    l_data <- readr::read_delim( inputfile, ":", escape_double = FALSE, col_names = FALSE, na = "empty", comment = "#", trim_ws = TRUE)
    l_data <- l_data[ !(l_data$X2 == ""), ]


    # clean-up text data
    l_labels  = as.vector( l_data$X1 )
    l_feature = lapply( as.vector(l_data$X2), tm::stripWhitespace)
    l_feature = lapply( l_feature, tolower )
    l_feature = lapply( l_feature, tm::removeNumbers )
    l_feature = lapply( l_feature, tm::removePunctuation )
    l_feature = lapply( l_feature, function(x) { return( tm::removeWords( x, tm::stopwords( stopwordlanguage )) ) } )

    # calculate with normalized compression distance the dissimilarity matrix and build graph
    l_graph <- igraph::graph_from_adjacency_matrix( outer( l_feature, l_feature, Vectorize( analysis.ncd, vectorize.args=list( "p_first", "p_second" )) ), diag = FALSE, weighted = TRUE, mode = "upper" )

    # run spectal clustering for finding groups
    #analysis.spectralclustering( l_graph )

    return(
        structure(
            class = "neighbourhood",
            list(
                points = analysis.mds( l_graph )$points,
                labels = l_labels
            )
        )
    )
    # visualization
    #plot( l_mds$points[,1], l_mds$points[,2], type="n", ylab="", xlab="", xaxt="n", yaxt="n" )
    #text( l_mds$points[,1], l_mds$points[,2], l_labels, cex=0.6 )
}
