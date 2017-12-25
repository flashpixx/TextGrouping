# Normalized Compression Distance
#
# http://en.wikipedia.org/wiki/Normalized_Compression_Distance
analysis.ncd <- function(
    p_first,
    p_second
) {
  if ( p_first == p_second )
      return(0)

  l_first <- length( memCompress( p_first, type=c(c("bzip2")) ) )
  l_second <- length( memCompress( p_second, type=c(c("bzip2")) ) )

  l_firstsecond = length( memCompress( paste(p_first, p_second, sep=""), type=c(c("bzip2"))) )
  l_secondfirst = length( memCompress( paste(p_second, p_first, sep=""), type=c(c("bzip2"))) )

  return(
      ( 0.5 * ( l_firstsecond + l_secondfirst ) - min( l_first, l_second ) ) /
      max( l_first, l_second )
  )
}
