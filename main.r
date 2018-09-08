source( "installdeps.r", local = TRUE )

library( "tm" )
library( "SnowballC" )
library( "zoo" )
library( "apcluster" )
library( "viridis" )
library( "optparse" )

source( "analysis/neighbourhood.r", local = TRUE )
source( "analysis/somwine.r", local = TRUE )
source( "common/ui.r", local = TRUE )

option_list = list(
  make_option( c("-p", "--port"), type="integer", default=8080, 
              help="bind to port", metavar="integer" ),
  make_option( c("-m", "--mode"), type="character", default="all", 
              help="modes to display (all|som|text) [default= %default]", metavar="character" ),
  make_option( c("-s", "--somdim"), type="integer", default=35, 
              help="som dimension", metavar="integer" )
) 

opt_parser = OptionParser( option_list = option_list )
opt = parse_args( opt_parser )

print( opt )

shiny::runApp(
	shinyApp(
	    ui = common.ui( opt ),
	    server = function( input, output ) {
	        observeEvent( input$viewtext, {
	            output$neighborhood <- renderPlot({
	                tryCatch({
	                    l_result <- build.neighbourhood( input$textdata, input$language )
	                    apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=input$opt.cex )
	                    text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=input$opt.cex )
	                },
	                error = function(e) {
	                    showNotification( paste(e), duration = 2 )
	                } )
	            })
	        } )
	        observeEvent( input$viewwine, {
	            output$som <- renderPlot({
	                tryCatch({
	                    l_result <- som.wine( input )
	                    plot( l_result, type = "property", property = getCodes(l_result)[,3], main = "", palette.name = viridis::plasma, tricolor, heatkey = FALSE, shape = "straight", border = NA )
	                },
	                error = function(e) {
	                    showNotification( paste(e), duration = 2 )
	                } )
	            })
	        } )
	    }
	),
	host = "0.0.0.0",
	port = as.numeric( opt$port )
)

