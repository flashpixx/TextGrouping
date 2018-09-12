source( "installdeps.r", local = TRUE )
source( "analysis/neighbourhood.r", local = TRUE )
source( "analysis/somwine.r", local = TRUE )

quartzFonts(firasans = c("Fira Sans Book", "Fira Sans Bold", "Fira Sans Italic", "Fira Sans Bold Italic"))

#* @post /textmining/pdf
#* @param miningtext name:thesis abstract formatted string
#* @serializer contentType list(type="application/pdf")
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

#* @post /textmining/png
#* @param miningtext name:thesis abstract formatted string
#* @png (width = 1600, height = 1000)
textMiningPNG <- function( miningtext ) {
  par( family='firasans' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=1.5 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=1.5 )
}

#* @post /textmining/jpeg
#* @param miningtext name:thesis abstract formatted string
#* @jpeg (width = 1600, height = 1000)
textMiningJPEG <- function( miningtext ) {
  par( family='firasans' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=1.5 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=1.5 )
}

#* @post /textmining/json
#* @param miningtext name:thesis abstract formatted string
#* @type string
#* @format text
#* @html
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

#* @post /som/png
#* @param winedata JSON encapsulated CVS
#* @param dimension SOM dimensions for x and y
#* @param iterations SOM iterations
#* @png (width = 1600, height = 1000)
somPNG <- function( winedata, dimension=18, iterations=60 ) {
  par( family='firasans' )
  par(fig=c(0,0.7,0,1))
  #layout( matrix( c(1,2,1,3), 2, 2, byrow = TRUE ), widths=c(12,3), heights=c(10,2) )
  l_result <- som.wine( gsub("\\\\n","\n", winedata ), dimension, iterations )
  plot( l_result, type = "property", property = getCodes(l_result)[,3], main = "", palette.name = viridis::plasma, tricolor, heatkey = FALSE, shape = "straight", border = NA )
  par(fig=c(0.7,1,0.5,1), new=TRUE)
  plot( l_result, type = "count", main="Node Count", palette.name = viridis::plasma, shape = "straight", border = NA )
  par(fig=c(0.7,1,0.1,0.5),new=TRUE)
  plot( l_result, type = "changes", main="Training Progress" )
}

#* @post /som/pdf
#* @param winedata JSON encapsulated CVS
#* @serializer contentType list(type="application/pdf")
somPDF <- function( miningtext ) {
  tmp <- tempfile()
  pdf(tmp)
  par( family='Helvetica' )
  l_result <- build.neighbourhood( gsub("\\\\n","\n", miningtext ) )
  apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=0.6 )
  text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=0.6 )
  dev.off()
  readBin(tmp, "raw", n=file.info(tmp)$size)
}
