# check library dependencies
common.dependencies <- function( ...)
{
    # check for required packages
    for ( i in c(...) )
    {
        if (!is.element( i, installed.packages()[,1] ) )
            install.packages( i )

        library( i, character.only=TRUE )
    }
}
