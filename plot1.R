## The purpose of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a histogram of global active power(kilowatts)

setwd("C:/Users/admin/Documents/Yen/RFile/ExData_Plotting1")

powerc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

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

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
