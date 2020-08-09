## The purpose of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a histogram of global active power(kilowatts)

setwd("C:/Users/admin/Documents/Yen/RFile/ExData_Plotting1")

powerc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(powerc$Date, powerc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerc <- cbind(powerc, FullTimeDate)

## change class of all columns to correct class
powerc$Date <- as.Date(powerc$Date, format="%d/%m/%Y")
powerc$Time <- format(powerc$Time, format="%H:%M:%S")
powerc$Global_active_power <- as.numeric(powerc$Global_active_power)
powerc$Global_reactive_power <- as.numeric(powerc$Global_reactive_power)
powerc$Voltage <- as.numeric(powerc$Voltage)
powerc$Global_intensity <- as.numeric(powerc$Global_intensity)
powerc$Sub_metering_1 <- as.numeric(powerc$Sub_metering_1)
powerc$Sub_metering_2 <- as.numeric(powerc$Sub_metering_2)
powerc$Sub_metering_3 <- as.numeric(powerc$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(powerc, Date == "2007-02-01" | Date =="2007-02-02")

## plot the 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subsetdata, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(subsetdata, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
