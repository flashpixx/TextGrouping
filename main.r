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
               help="bind to port [default = %default]", metavar="integer" ),
  make_option( "--shownodename", action="store_true", default=FALSE,
               help="display node name in title (helpful to distiguish app running in different docker containers) [default = %default]", metavar="character" ),
  make_option( c("-s", "--somdim"), type="integer", default=35,
               help="som dimension [default = %default]", metavar="integer" ),
  make_option( c("-i", "--somiterations"), type="integer", default=100,
               help="som iterations [default = %default]", metavar="integer" ),
  make_option( "--pointlabelsize", type="double", default=1.75,
               help="size of text mining labels [default = %default]", metavar="double" )
)

opt_parser = OptionParser( option_list = option_list )
opt = parse_args( opt_parser )

quartzFonts(firasans = c("Fira Sans Book", "Fira Sans Bold", "Fira Sans Italic", "Fira Sans Bold Italic"))

shiny::runApp(
  shinyApp(
    ui = common.ui( opt ),
    server = function( input, output ) {
      observeEvent( input$viewtext, {
        output$neighborhood <- renderPlot({
          progress <- shiny::Progress$new(style = "notification")
          tryCatch({
            par(family='firasans')
            progress$set(message = "Building neighbourhood", value = 0.1)
            l_result <- build.neighbourhood( input$textdata, input$language, progress )
            progress$set(message = "Rendering plots", value = 0.8)
            par(lwd=3.5)
            apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=input$opt.cex )
            text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=input$opt.cex )
            progress$set(message = "Finished", value = 1)
          },
          error = function(e) {
            showNotification( paste(e), duration = 2 )
          })
          progress$close()
        })
      })
      observeEvent( input$viewwine, {
        progress <- shiny::Progress$new(style = "notification")
        tryCatch({
          progress$set(message = "Computing data", value = 0)
          l_result <- som.wine( input$winedata, input$opt.somdim, input$opt.somiterations, progress )
          progress$set(message = "Rendering plots", value = 0.8)
          output$som <- renderPlot({
            par( family='firasans' )
            plot( l_result, type = "property", property = getCodes(l_result)[,3], main = "", palette.name = viridis::plasma, tricolor, heatkey = FALSE, shape = "straight", border = NA )
          })
          progress$set(message = "Rendering plots", value = 0.9)
          output$count <- renderPlot({
            par( family='firasans' )
            plot( l_result, type = "count", main="Node Count", palette.name = viridis::plasma, shape = "straight", border = NA )
          })
          output$changes <- renderPlot({
            par( family='firasans' )
            plot( l_result, type = "changes", main="Training Progress" )
          })
          progress$set(message = "Finished", value = 1) },
          error = function(e) {
            showNotification( paste(e), duration = 2 )
          })
        progress$close()
      })
    }
  ),
  host = "0.0.0.0",
  port = as.numeric( opt$port )
)

