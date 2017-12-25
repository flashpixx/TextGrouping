source( "neighbourhood.r", local = attach( NULL ) )

shinyApp(

    ui = fluidPage(
        titlePanel( "TextMining-Grouping" ),
        fluidRow(
            column(3,
                   wellPanel(
                        selectInput("language", label="Stopword Language", list("english", "danish", "german", "dutch", "finnish", "french", "hungarian", "italian", "norwegian", "portuguese", "russian", "spanish", "swedish"), selected = "english", multiple = FALSE, selectize = TRUE)
                   )
            ),
            column(9,
                   wellPanel(
                       textAreaInput("data", "Input Labels and Text", "Label 1: Any text without linebreaks\nLabel 2: Another text without linebreaks", rows = 12)
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
                   plotOutput("neighborhood")
            )
        )
    ),

    server = function( input, output ) {
        observeEvent( input$view, {
            output$neighborhood <- renderPlot({
                tryCatch({
                    l_result <- build.neighbourhood( input$data, input$language )
                    plot( l_result$points[,1], l_result$points[,2], type="n", ylab="", xlab="", xaxt="n", yaxt="n" )
                    text( l_result$points[,1], l_result$points[,2], l_result$labels, cex=0.6 )
                },
                error = function(e) {
                    showNotification( paste(e), duration = 2 )
                } )
            })
        } )
    }

)
