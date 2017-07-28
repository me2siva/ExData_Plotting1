## Loading the data
EPCdata <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

EPCdata$Date <- as.Date(EPCdata$Date, format="%d/%m/%Y")

data <- subset(EPCdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPCdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Par 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright",bty="n", col=c("black", "red", "blue"),lty=1,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

## Device to Device copy
dev.copy(png, file="plot4.png", height=480, width=480)
## close the device
dev.off()
