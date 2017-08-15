PowerConsumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## reading in the data

subsetPower <- subset(PowerConsumption,PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date =="2/2/2007") ## subsetting the data to include only info                                           between the dates of 1/2/2007 and 2/2/2007

DateWithTime <- paste(as.Date(subsetPower$Date, format = '%d/%m/%Y'), subsetPower$Time) ## combining the date and time for each entry
subsetPower$DateWithTime <- as.POSIXct(DateWithTime)

grDevices::png(filename = "plot2.png") ## sets the graphics device

plot(subsetPower$Global_active_power~subsetPower$DateWithTime, type = "l", ylab= "Global Active Power(kilowatts)", xlab="") ## makes the line graph
dev.off()## switches off the graphics device from png to the default

