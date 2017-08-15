PowerConsumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## reading in the data

subsetPower <- subset(PowerConsumption,PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date =="2/2/2007") ## subsetting the data to include only info                                           between the dates of 1/2/2007 and 2/2/2007
DateWithTime <- paste(as.Date(subsetPower$Date, format = '%d/%m/%Y'), subsetPower$Time) ## combining the date and time for each entry
subsetPower$DateWithTime <- as.POSIXct(DateWithTime)

grDevices::png(filename = "plot4.png") ## sets the graphics device

par(mfrow = c(2,2), mar = c(4,4,1,1))
## first plot
plot(subsetPower$Global_active_power~subsetPower$DateWithTime, type = "l", ylab= "Global Active Power(kilowatts)", xlab="") ## makes the line graph

## second plot
plot(subsetPower$Voltage~subsetPower$DateWithTime, type = "l", ylab = "Voltage", xlab= "datetime")

## third plot
with(subsetPower, {
        plot(Sub_metering_1~DateWithTime, type="l", ylab = "Energy sub Metering", xlab= "")
        lines(Sub_metering_2~DateWithTime, col="red")
        lines(Sub_metering_3~DateWithTime, col= "blue")
})
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1), col = c("black","red","blue"))

## fourth plot
plot(subsetPower$Global_reactive_power~subsetPower$DateWithTime, type= "l", ylab= "Global_reactive_power", xlab = "datetime")
dev.off()
