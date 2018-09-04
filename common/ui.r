common.ui <- function( modes )
{
    if (modes == "all")
    	return(navbarPage("Mining Box",
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
	    )))
	if (modes == "som")
    	return(navbarPage("Mining Box",
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
	    )))
	if (modes == "text")
    	return(navbarPage("Mining Box",
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
	    )))
}
