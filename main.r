source( "installdeps.r", local = TRUE )

args <- commandArgs(trailingOnly = TRUE)

if (length(args)==1) {
  shiny::runApp(port = as.numeric(args[1]))
} else if (length(args)==0) {
  shiny::runApp()
}