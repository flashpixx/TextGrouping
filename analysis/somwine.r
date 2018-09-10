# plots a som
#
# @param filename file name of appstore data
# @see https://www.shanelynn.ie/self-organising-maps-for-customer-segmentation-using-r/
# @see https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009
som.wine <- function( input, progress )
{
    # read data and convert to matrix
    progress$set(message = "Convert data to matrix", value = 0.2)
    l_data <- as.matrix( scale( readr::read_csv(input$winedata) ) )

    # create som and train
    progress$set(message = "Create SOM grid", value = 0.3)
    l_grid <- kohonen::somgrid( xdim=input$opt.somdim, ydim=input$opt.somdim, topo="hexagonal" )
    progress$set(message = "Train SOM", value = 0.4)
    l_som <- kohonen::som( l_data, grid = l_grid, rlen = input$opt.somiterations, alpha=c(0.05,0.01), keep.data = TRUE )
    
    return( l_som )
}
