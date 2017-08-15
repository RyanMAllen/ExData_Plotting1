PowerConsumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## reading in the data

subsetPower <- subset(PowerConsumption,PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date =="2/2/2007") ## subsetting the data to include only info                                           between the dates of 1/2/2007 and 2/2/2007
 grDevices::png(filename = "Plot1.png") ## sets the graphic device as a png file

hist(as.numeric(subsetPower$Global_active_power), xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power") ## creates the histogram 
dev.off() ## turns off the png graphic device
