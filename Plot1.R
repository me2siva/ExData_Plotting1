## Loading the data
EPCdata <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

EPCdata$Date <- as.Date(EPCdata$Date, format="%d/%m/%Y")

data <- subset(EPCdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPCdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Hist graph : Global Active Power(Kilowatts) vs. Frequency  
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
## closedevice
dev.off()
