source( "endswith.r" )

# saves the current plot to a PDF file
# @param filename filename
# @param width image width in centimeter
# @param height image height in centimeter
common.pdf <- function( filename, width=29.7, height=21 )
{
    if ( !common.endswith( filename, ".pdf" ) )
        filename = paste(filename, ".pdf", sep="")

    l_ignore <- dev.copy2pdf( file=filename, width=width / 2.54, height=height / 2.54 )
}
