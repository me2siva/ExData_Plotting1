## Loading the data
EPCdata <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

EPCdata$Date <- as.Date(EPCdata$Date, format="%d/%m/%Y")

data <- subset(EPCdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPCdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Hist graph : EnergySub meterings  vs. Week days  
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty="solid", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## device to device copy
dev.copy(png, file="plot3.png", height=480, width=480)

## close device
dev.off()