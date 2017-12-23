# checks a string if ends with a data set
#
# @param haystack search string
# @param needle search string
common.endswith <- function(haystack, needle)
{
    hl <- nchar(haystack)
    nl <- nchar(needle)
    if(nl>hl)
        return (F)
    else
        return(substr(haystack, hl-nl+1, hl) == needle)
}
