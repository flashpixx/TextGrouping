source( "analysis/ncd.r", local = TRUE )

# calculate neighbourhood of text data
build.neighbourhood <- function( inputfile, stopwordlanguage = "english" )
{
    # read csv (first column name, second column keywords)
    l_data <- readr::read_delim( inputfile, ":", escape_double = FALSE, col_names = FALSE, na = "empty", comment = "#", trim_ws = TRUE)
    l_data <- l_data[ !(l_data$X2 == ""), ]


    # clean-up text data
    l_labels  = as.vector( l_data$X1 )
    l_feature = lapply( as.vector(l_data$X2), tm::stripWhitespace)
    l_feature = lapply( l_feature, tolower )
    l_feature = lapply( l_feature, tm::removeNumbers )
    l_feature = lapply( l_feature, tm::removePunctuation )
    l_feature = lapply( l_feature, function(x) { return( tm::removeWords( x, tm::stopwords( stopwordlanguage )) ) } )

    # calculate with normalized compression distance the dissimilarity matrix
    l_dissimilarity <- outer( l_feature, l_feature, Vectorize( analysis.ncd, vectorize.args=list( "first", "second" )) )

    # run multidimensional scaling to build 2D projection
    #
    # https://en.wikipedia.org/wiki/Multidimensional_scaling
    # https://www.statmethods.net/advstats/mds.html
    l_mds <- cmdscale( l_dissimilarity, eig=TRUE, k=2 )$points

    # run affinity propagation to find data groups
    #
    # https://www.rdocumentation.org/packages/apcluster/versions/1.4.4/topics/apcluster-package
    # https://cran.r-project.org/web/packages/apcluster/vignettes/apcluster.pdf

    return(
        structure(
            class = "neighbourhood",
            list(
                points = l_mds,
                labels = l_labels,
                cluster = apcluster::apcluster( apcluster::negDistMat(r=2), l_mds )
            )
        )
    )
}
