library( "tm" )
library( "SnowballC" )
library( "zoo" )
library( "apcluster" )

source( "analysis/neighbourhood.r", local = TRUE )

shinyApp(

    ui = fluidPage(
        titlePanel( "TextMining-Grouping" ),
        fluidRow(
            column(3,
                   wellPanel(
                        selectInput("language", label="Stopword Language", list("english", "danish", "german", "dutch", "finnish", "french", "hungarian", "italian", "norwegian", "portuguese", "russian", "spanish", "swedish"), selected = "english", multiple = FALSE, selectize = TRUE)
                   ),
                   wellPanel(
                        sliderInput(inputId = "opt.cex", label = "Point Label Size", min = 0, max = 2, step = 0.25, value = 1)
                   )
            ),
            column(9,
                   wellPanel(
                       textAreaInput("data", "Input Labels and Text", "Label 1: Any text without linebreaks\n#comment line\nLabel 2: Another text without linebreaks", rows = 12)
                   )
            )
        ),
        fluidRow(
            column(12,
               actionButton("view", "Visualize")

            )
        ),
        hr(),
        fluidRow(
            column(12,
                   plotOutput("neighborhood", width="100%", height="1000px")
            )
        )
    ),

    server = function( input, output ) {
        observeEvent( input$view, {
            output$neighborhood <- renderPlot({
                tryCatch({
                    l_result <- build.neighbourhood( input$data, input$language )
                    #assign( "data", l_result, env = globalenv() )

                    apcluster::plot( l_result$cluster, l_result$points, xaxt="n", yaxt="n", cex=input$opt.cex )
                    text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=input$opt.cex )
                },
                error = function(e) {
                    showNotification( paste(e), duration = 2 )
                } )
            })
        } )
    }

)

