source("dependency.r")

common.dependencies("plumber")

server <- plumber::plumb( "service.r"  )
server$run( host = '0.0.0.0', port = 9000 )
