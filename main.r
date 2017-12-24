source( "dependency.r", local = attach( NULL ) )

common.dependencies( "shiny" )
shiny::runApp(".")
