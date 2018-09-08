# plots a som
#
# @param filename file name of appstore data
# @see https://www.shanelynn.ie/self-organising-maps-for-customer-segmentation-using-r/
# @see https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009
som.wine <- function( input )
{
    # read data and convert to matrix
    l_data <- as.matrix( scale( readr::read_csv(input$winedata) ) )

    # create som and train
    l_grid <- kohonen::somgrid( xdim=input$opt.somdim, ydim=input$opt.somdim, topo="hexagonal" )
    l_som <- kohonen::som( l_data, grid = l_grid, rlen = 100, alpha=c(0.05,0.01), keep.data = TRUE )
    
    return( l_som )
}
