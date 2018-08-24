library( "tm" )
library( "SnowballC" )
library( "zoo" )
library( "apcluster" )

source( "analysis/neighbourhood.r", local = TRUE )
source( "analysis/somwine.r", local = TRUE )

shinyApp(

    ui = navbarPage("naim.tech",
      tabPanel("TextMining (Grouping)",
        fluidPage(
            titlePanel( "TextMining (Ph.D. Projects Example)" ),
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
                           textAreaInput("textdata", "Input Labels and Text", "Label 1: Any text without linebreaks\n#comment line\nLabel 2: Another text without linebreaks", rows = 12)
                       )
                )
            ),
            fluidRow(
                column(12,
                   actionButton("viewtext", "Visualize")

                )
            ),
            hr(),
            fluidRow(
                column(12,
                       plotOutput("neighborhood", width="100%", height="1000px")
                )
            )
        )
    ),
    tabPanel("SOM (Wine)",
        fluidPage(
            titlePanel( "Self Organizing Map (Wine Example)" ),
            fluidRow(
                column(5,
                    wellPanel(
                        textAreaInput("winedata", "Input CSV", "", rows = 30)
                    ),
                    actionButton("viewwine", "Visualize")
                ),
                column(7,
                    plotOutput("som", height="1000px"),
                    style='margin-top: -60px;'
                )
            )
        )
    )),
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
                    l_result <- som.wine( input$winedata )
                    plot( l_result, type = "property", property = getCodes(l_result)[,3], main = "", palette.name = rainbow, tricolor, heatkey = FALSE )
                },
                error = function(e) {
                    showNotification( paste(e), duration = 2 )
                } )
            })
        } )
    }

)

