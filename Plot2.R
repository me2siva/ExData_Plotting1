## Loading the data
EPCdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

EPCdata$Date <- as.Date(EPCdata$Date, format="%d/%m/%Y")

data <- subset(EPCdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPCdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

 ## Hist graph : Global Active Power(Kilowatts) vs. Week days 
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
## copy device to device
dev.copy(png, file="plot2.png", height=480, width=480)

## close device off
dev.off()