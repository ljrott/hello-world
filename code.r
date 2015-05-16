library(R.oo)

# rename columns
names(data) <- c("institution","address","city","zip","county","location")

# trim whitespace and replace two-length spaces with one-length
data[,-1] <- trim(as.matrix(data[,-1]))
data[,-1] <- gsub("  ", " ", as.matrix(data[,1]))

# get rid of line breaks in the location column
data$location <- gsub("\\n", " ", data$location)

