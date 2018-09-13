library( "plumber" )
plumber::plumb( "common/rest.r" )$run( port=8080, host="0.0.0.0", swagger = TRUE )