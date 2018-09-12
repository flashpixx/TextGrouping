# plots a som
#
# @param filename file name of appstore data
# @see https://www.shanelynn.ie/self-organising-maps-for-customer-segmentation-using-r/
# @see https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009
som.wine <- function( input, progress = NA )
{
    # read data and convert to matrix
    if ( !is.na( progress ) ) progress$set(message = "Converting data to matrix", value = 0.2)
    l_data <- as.matrix( scale( readr::read_csv(input$winedata) ) )

    # create som and train
    if ( !is.na( progress ) ) progress$set(message = "Creating SOM grid", value = 0.3)
    l_grid <- kohonen::somgrid( xdim=input$opt.somdim, ydim=input$opt.somdim, topo="hexagonal" )
    if ( !is.na( progress ) ) progress$set(message = "Training SOM", value = 0.4)
    l_som <- kohonen::som( l_data, grid = l_grid, rlen = input$opt.somiterations, alpha=c(0.05,0.01), keep.data = TRUE )
    
    return( l_som )
}
