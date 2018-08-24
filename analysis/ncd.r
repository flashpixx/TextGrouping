# Normalized Compression Distance
#
# http://en.wikipedia.org/wiki/Normalized_Compression_Distance
analysis.ncd <- function(
    first,
    second
) {
  if ( first == second )
      return(0)

  l_first <- length( zstdCompress( first, level = 22 ) )
  l_second <- length( zstdCompress( second, level = 22 ) )

  l_firstsecond = length( zstdCompress( paste( first, second, sep="" ), level = 22 ) )
  l_secondfirst = length( zstdCompress( paste( second, first, sep="" ), level = 22 ) )

  return(
      ( 0.5 * ( l_firstsecond + l_secondfirst ) - min( l_first, l_second ) ) /
      max( l_first, l_second )
  )
}
