# plot3

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
subMetering1 <- as.numeric(subsetdatatable$Sub_metering_1)
subMetering2 <- as.numeric(subsetdatatable$Sub_metering_2)
subMetering3 <- as.numeric(subsetdatatable$Sub_metering_3)
globalReactivePower<- as.numeric(subsetdatatable$Global_reactive_power)
Voltage<- as.numeric(subsetdatatable$Voltage)

# Make plot4
#configure for multiple base plots
par(mfcol = c(2, 2))


#upper left plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#lower left plot
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty = "n", col=c("black", "red", "blue"))

#upper right plot
plot(datetime, Voltage, type="l")

#lower right plot
plot(datetime, globalReactivePower, type="l", ylab = "Globa_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()