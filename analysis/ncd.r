# Normalized Compression Distance
#
# http://en.wikipedia.org/wiki/Normalized_Compression_Distance
analysis.ncd <- function(
    first,
    second
) {
  if ( first == second )
      return(0)

  l_first <- length( memCompress( first, type=c(c("bzip2")) ) )
  l_second <- length( memCompress(second, type=c(c("bzip2")) ) )

  l_firstsecond = length( memCompress( paste(first, second, sep=""), type=c(c("bzip2"))) )
  l_secondfirst = length( memCompress( paste(second, first, sep=""), type=c(c("bzip2"))) )

  return(
      ( 0.5 * ( l_firstsecond + l_secondfirst ) - min( l_first, l_second ) ) /
      max( l_first, l_second )
  )
}
