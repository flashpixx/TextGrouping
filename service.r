#' returns a the input text
#' @get /echo
#' @param msg a message text
function(msg=""){
    list(msg = paste0("The message is: '", msg, "'"))
}



#' calculates the mean of random samples
#' @get /mean
#' @param samples number of samples (default 10)
function(samples=10){
    data <- rnorm(samples)
    mean(data)
}





#' calculates a sum of two elements
#' @post /sum
#' @param a first element
#' @param b second element
function(a, b){
    as.numeric(a) + as.numeric(b)
}
