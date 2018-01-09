# plot1

# Read data file
rawdata <- "./household_power_consumption.txt"

# Convert data file to data frame using the read.table function
# data file contains headers, values are seperated by a semi-colon, 
#character vectors not converted to factors, and decimals are repesented as "."
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## data frame is subset for applicable dates using the match function
subsetdatatable <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Make plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(subsetdatatable$Global_active_power), main = "Global Active Power", xlab ="Global Active Power (kilowatts)" , col = "red")
dev.off()