library( "plumber" )
plumber::plumb("common/rest.r")$run(port=8000, host="0.0.0.0")