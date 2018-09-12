source( "installdeps.r", local = TRUE )
source( "analysis/neighbourhood.r", local = TRUE )
source( "analysis/somwine.r", local = TRUE )

quartzFonts(firasans = c("Fira Sans Book", "Fira Sans Bold", "Fira Sans Italic", "Fira Sans Bold Italic"))

#' @post /textmining/pdf
#' @param miningtext name:thesis abstract formatted string
#' @serializer contentType list(type="application/pdf")
textMiningPDF <- function( miningtext ) {
  tmp <- tempfile()
  pdf(tmp)
  par( family='Helvetica' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=0.6 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=0.6 )
  dev.off()
  readBin(tmp, "raw", n=file.info(tmp)$size)
}

#' @post /textmining/png
#' @param miningtext name:thesis abstract formatted string
#' @png (width = 1600, height = 1000)
textMiningPNG <- function( miningtext ) {
  par( family='Helvetica' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=1.5 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=1.5 )
}

#' @post /textmining/jpeg
#' @param miningtext name:thesis abstract formatted string
#' @jpeg (width = 1600, height = 1000)
textMiningJPEG <- function( miningtext ) {
  par( family='Helvetica' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=1.5 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=1.5 )
}

#' @post /textmining/json
#' @param miningtext name:thesis abstract formatted string
#' @type string
#' @format text
#' @html
textMiningJSON <- function( miningtext ) {
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  l_data <- data.frame(
    x = l_result$points[,1],
    y = l_result$points[,2],
    label = l_result$labels )
  l_cluster <- vector("list", length( l_result$cluster ) )
  l_labels <- data.frame(l_result$labels)
  
  for ( i in 1:length( l_result$cluster ) ) {
    l_cluster[[i]] <- as.vector(l_labels[as.vector(l_result$cluster[[i]]),])
  }
  paste0(jsonlite::toJSON(l_data, pretty = TRUE, unboxed = TRUE), ",\n", jsonlite::toJSON(l_cluster, pretty = TRUE, unboxed = TRUE))
}


