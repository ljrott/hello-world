library(R.oo)
library(stringr)

# rename columns
names(data) <- c("institution","address","city","zip","county","location")

# trim whitespace and replace two-length spaces with one-length
data[,-1] <- trim(as.matrix(data[,-1]))
data[,-1] <- gsub("  ", " ", as.matrix(data[,-1]))

# function to set first letter of each word to uppercase
capwords <- function(s, strict = FALSE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
{s <- substring(s, 2); if(strict) tolower(s) else s},
sep = "", collapse = " " )
sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

# standardize case of city and county names (ALBANY > Albany)
data$city <- tolower(data$city)
data$city <- capwords(data$city)
data$county <- tolower(data$county)
data$county <- capwords(data$county)

# get rid of line breaks in the location column
# data$location <- gsub("\\n", " ", data$location)

# pull out latitude and longitude
patternLat <- "[4][0-9]{1}[.][0-9]*"
patternLong <- "[-][7][0-9]{1}[.][0-9]*"
data$latitude <- str_extract(data$location, patternLat)
data$longitude <- str_extract(data$location, patternLong)
