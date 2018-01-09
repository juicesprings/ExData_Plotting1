# plot2

# Read data file
rawdata <- "./household_power_consumption.txt"

# Convert data file to data frame using the read.table function
# data file contains headers, values are seperated by a semi-colon, 
#character vectors not converted to factors, and decimals are repesented as "."
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## data frame is subset for applicable dates using the match function
subsetdatatable <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date and time
datetime <- strptime(paste(subsetdatatable$Date, subsetdatatable$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert to numeric
globalActivePower <- as.numeric(subsetdatatable$Global_active_power)

# Make plot2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

