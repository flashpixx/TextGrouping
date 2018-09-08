common.ui <- function( opt )
{
    if (opt$mode == "all")
    	return(navbarPage(title=div(img(src="data:image/png;base64,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"), "Smart Box | AI Container"),
    	  windowTitle="Smart Box | AI Container",
	      tabPanel( div( img( src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAdCAYAAABSZrcyAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAAgtpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj41PC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPjI8L3RpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CobSriQAAAMESURBVEgNxZZNaNNgGMfzNp9v06UZgyHObeJJmA4ZE4dIS9FNEYYfjAp6cAcRBFEHQ0EFD17Ug+hd0ZMfY3Mni+hYddYxUEHFeVEE9eDm3NaPNE3SfNgUG9L0Tbeuq+aS5/0////zS15C32LYf7zAUuwHL18flzGwcymfs0/o6uSRYNdNp25fl4VPTU1xHw34IcH4W+2h5dScLMw0K1LHnkDnTze/x61h6l9l7FqC5ioGm9kk7VvzG1OvmrXb5QofehZrSVHsAQyU3Ry3uXldoOt6H0VfbXIzucIVmrwiMHWNbsHl6GmK5dM4cdnNi4SPTEx0pGhur1uoEj0J/T0jY7EQKoOEixhzSaSgHxWoVJMIxivQ9HlUrgQ+PD6xOwH5bpR5pVoS8sGh6ItDznwJXKS8Z2WCgk5jNWsFJ0kR9542DKPo6y2CD4/FjsYhH6gG5JZN+Bq6Ho5PnrT3LXjuqTxphj2R9RCE3bBatQo8IEPDY9PT01RhpgUfeh4bWIDctkKjFve4t779/ez8hcLsPDwajTIC6evXPXhBr8ldz/1giQx3OBKJcCYgD09o+AaFZFpqQnQMlUnvWomE7RZ8/67AJ5+UfOLw1WTJZeJjB7tDMQtuFjwmXWRlYbEmxL9DoSIKUEpbP7fWB9cbDH5mJeFxLeG53X3a1xN6U2BYcFPgGHbQL6fmC83VvPuUdJLR9XP2mUXwfV2bZ6EkjgJDt3uqrw0Dg5lUJBza/sU+rAhuNkjDN8BlknN2U7W1X0nF/Qx7xjmnBB4OtQmMqtz36JrTu6K1uYukIo2au+ocUAI3DRsDWwe5TGLGaV7JmpOSC7Bh/SlUFgnvBCBLGtptQsuiMsvWcE3FaF27F25rFFChoiPObjAPmjuT774veuub7HolNS8uztXxW9aF24CCyiHf3DQCAHQMYDdoVUblltRIVcFIgN1yA+cZ5aaYh//d2NtvWZxqLudD9Sgt+6t1R0dTCAAV1Te1smd37u2N6+9+9BmGXvGfSRwH4/1lwG4P9M/0P3fi70TojNBdAAAAAElFTkSuQmCC" ), "Text Mining" ),
	        fluidPage(
	            titlePanel( "Ph.D. Projects Example" ),
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
	    tabPanel( div( img( src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAdCAYAAABSZrcyAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAAgtpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj41PC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPjI8L3RpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CobSriQAAAMZSURBVEgNY2AYQMBIyO4JiyeUs3KzGhFShy7/5/Ov3fnxhXPQxZH5eC3vmtSlLGEkfpxfhl8UWRMx7De33tx7d/G9Xmlp6Vdc6plwSYDEOUQ52sixGKRXWEVYiVWCtQPExgVwWt49pdtcWFnIE5dGQuKMTIwMAvICQZ2TO6VwqcVpOacEZx2PGA8vLo3EiAvKCUhxCHLg9D1Wy7tndPuKqYo6E2MBITXA0PPpntath00dVsuBPi5h52dnx6aBVDFeSV5BThHOBmz6MCzvmdmTIqolYo1NMbliwMTn3jmjEyMkUSxvaGhg4ZXizWDlYGUm1yJs+riEOLn4xHjK0eVQLOeW4S4V1RA1RldEDb6ImqhDx7SOKGSz4D7s7u7mFlITmAqMbxFkBdRiM7MxM//5+kfKRMNk/oEDB/6DzIX7nEWUpUFYVUSDWpZhM0dcW8yCR4onFyYHtry1tVVcQEEgDFQw0BIwsTIx8svwJU2aNAmck8CWs/Gy6XIJcJJcfpPjUGAWlv7065MESC/Y8tK80j1vbr/eR45hpOr58PDj1pqSmodwy0GMLx++tXx59RVnDUSqJdjUv3/4/vX3t98rYXLwBFeeWn4CKLkHJkFt+v+//wyfnn7cUJ5b/gxmNtxykMD/3/8rPj759AUmSU367d23Lxn+MZUgm4lieW5U7o3Pzz9v//8fnA2R1VHE/vv7H8P3dz9W5sXkfUI2CMVykAQH27+C9/ffoyhC1kAO+93dd8/EGMVK0fViWJ7sn/vsy9uvm/79/Yeuliz+72+/GX59/bUgLCzsF7oBGJaDFLAJsOW8v/f+A7picvjvHrx/khmUWYtNL1bL013TP/768nPVn59/sOkhWuzHxx8M//78m8LIyIg1GHGWp/v/7+e4t+vuUxF1ESGibUNT+PLaywepnmlKQMuxpmCsPgeZ4cjo+OPvn38Lfn7+iWYkcdwvr78ysLAwd+CyGGQKTp+DJK/+v8p2ZMvhZ6zcbMIgPikAmNDupvukq+DTw4JPUptR+9eWJxtD//5lsMenDpsc03+mTdjEB40YAI4v6JWXw/D2AAAAAElFTkSuQmCC"), "Self Organizing Map" ),
	        fluidPage(
	            titlePanel( "Wine Data Example" ),
	            fluidRow(
	                column(5,
	                	wellPanel(
	                        sliderInput(inputId = "opt.somdim", label = "SOM (x,y) Grid Dimensions", min = 2, max = 39, step = 1, value = opt$somdim)
	                    ),
	                    wellPanel(
	                        textAreaInput("winedata", "Input CSV", "", rows = 30)
	                    ),
	                    actionButton("viewwine", "Visualize")
	                ),
	                column(7,
	                    plotOutput("som", height="1000px"),
	                    style='margin-top:-15%;'
	                )
	            )
	        )
	    )))
	if (opt$mode == "som")
    	return(navbarPage(div(img(src="data:image/png;base64,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"), "Smart Box | AI Container"),
    	  windowTitle="Smart Box | AI Container",
	      tabPanel( div( img( src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAdCAYAAABSZrcyAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAAgtpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj41PC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPjI8L3RpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CobSriQAAAMZSURBVEgNY2AYQMBIyO4JiyeUs3KzGhFShy7/5/Ov3fnxhXPQxZH5eC3vmtSlLGEkfpxfhl8UWRMx7De33tx7d/G9Xmlp6Vdc6plwSYDEOUQ52sixGKRXWEVYiVWCtQPExgVwWt49pdtcWFnIE5dGQuKMTIwMAvICQZ2TO6VwqcVpOacEZx2PGA8vLo3EiAvKCUhxCHLg9D1Wy7tndPuKqYo6E2MBITXA0PPpntath00dVsuBPi5h52dnx6aBVDFeSV5BThHOBmz6MCzvmdmTIqolYo1NMbliwMTn3jmjEyMkUSxvaGhg4ZXizWDlYGUm1yJs+riEOLn4xHjK0eVQLOeW4S4V1RA1RldEDb6ImqhDx7SOKGSz4D7s7u7mFlITmAqMbxFkBdRiM7MxM//5+kfKRMNk/oEDB/6DzIX7nEWUpUFYVUSDWpZhM0dcW8yCR4onFyYHtry1tVVcQEEgDFQw0BIwsTIx8svwJU2aNAmck8CWs/Gy6XIJcJJcfpPjUGAWlv7065MESC/Y8tK80j1vbr/eR45hpOr58PDj1pqSmodwy0GMLx++tXx59RVnDUSqJdjUv3/4/vX3t98rYXLwBFeeWn4CKLkHJkFt+v+//wyfnn7cUJ5b/gxmNtxykMD/3/8rPj759AUmSU367d23Lxn+MZUgm4lieW5U7o3Pzz9v//8fnA2R1VHE/vv7H8P3dz9W5sXkfUI2CMVykAQH27+C9/ffoyhC1kAO+93dd8/EGMVK0fViWJ7sn/vsy9uvm/79/Yeuliz+72+/GX59/bUgLCzsF7oBGJaDFLAJsOW8v/f+A7picvjvHrx/khmUWYtNL1bL013TP/768nPVn59/sOkhWuzHxx8M//78m8LIyIg1GHGWp/v/7+e4t+vuUxF1ESGibUNT+PLaywepnmlKQMuxpmCsPgeZ4cjo+OPvn38Lfn7+iWYkcdwvr78ysLAwd+CyGGQKTp+DJK/+v8p2ZMvhZ6zcbMIgPikAmNDupvukq+DTw4JPUptR+9eWJxtD//5lsMenDpsc03+mTdjEB40YAI4v6JWXw/D2AAAAAElFTkSuQmCC"), "Self Organizing Map" ),
	        fluidPage(
	            titlePanel( "Wine Data Example" ),
	            fluidRow(
	                column(5,
	                	wellPanel(
	                        sliderInput(inputId = "opt.somdim", label = "SOM (x,y) Grid Dimension", min = 2, max = 39, step = 1, value = opt$somdim)
	                    ),
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
	if (opt$mode == "text")
    	return(navbarPage(div(img(src="data:image/png;base64,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"), "Smart Box | AI Container"),
    	  windowTitle="Smart Box | AI Container",
	      tabPanel( div( img( src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAdCAYAAABSZrcyAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAAgtpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj41PC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPjI8L3RpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CobSriQAAAMESURBVEgNxZZNaNNgGMfzNp9v06UZgyHObeJJmA4ZE4dIS9FNEYYfjAp6cAcRBFEHQ0EFD17Ug+hd0ZMfY3Mni+hYddYxUEHFeVEE9eDm3NaPNE3SfNgUG9L0Tbeuq+aS5/0////zS15C32LYf7zAUuwHL18flzGwcymfs0/o6uSRYNdNp25fl4VPTU1xHw34IcH4W+2h5dScLMw0K1LHnkDnTze/x61h6l9l7FqC5ioGm9kk7VvzG1OvmrXb5QofehZrSVHsAQyU3Ry3uXldoOt6H0VfbXIzucIVmrwiMHWNbsHl6GmK5dM4cdnNi4SPTEx0pGhur1uoEj0J/T0jY7EQKoOEixhzSaSgHxWoVJMIxivQ9HlUrgQ+PD6xOwH5bpR5pVoS8sGh6ItDznwJXKS8Z2WCgk5jNWsFJ0kR9542DKPo6y2CD4/FjsYhH6gG5JZN+Bq6Ho5PnrT3LXjuqTxphj2R9RCE3bBatQo8IEPDY9PT01RhpgUfeh4bWIDctkKjFve4t779/ez8hcLsPDwajTIC6evXPXhBr8ldz/1giQx3OBKJcCYgD09o+AaFZFpqQnQMlUnvWomE7RZ8/67AJ5+UfOLw1WTJZeJjB7tDMQtuFjwmXWRlYbEmxL9DoSIKUEpbP7fWB9cbDH5mJeFxLeG53X3a1xN6U2BYcFPgGHbQL6fmC83VvPuUdJLR9XP2mUXwfV2bZ6EkjgJDt3uqrw0Dg5lUJBza/sU+rAhuNkjDN8BlknN2U7W1X0nF/Qx7xjmnBB4OtQmMqtz36JrTu6K1uYukIo2au+ocUAI3DRsDWwe5TGLGaV7JmpOSC7Bh/SlUFgnvBCBLGtptQsuiMsvWcE3FaF27F25rFFChoiPObjAPmjuT774veuub7HolNS8uztXxW9aF24CCyiHf3DQCAHQMYDdoVUblltRIVcFIgN1yA+cZ5aaYh//d2NtvWZxqLudD9Sgt+6t1R0dTCAAV1Te1smd37u2N6+9+9BmGXvGfSRwH4/1lwG4P9M/0P3fi70TojNBdAAAAAElFTkSuQmCC" ), "Text Mining" ),
	        fluidPage(
	            titlePanel( "Ph.D. Projects Example" ),
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
