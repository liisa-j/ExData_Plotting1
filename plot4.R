### Reading in the data 
###Sys.setlocale("LC_TIME", "C")


if(!file.exists("./ExploratoryDataAnalysis")){dir.create("./ExploratoryDataAnalysis")}
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./ExploratoryDataAnalysis/household_power_consumption.zip")
unzip(zipfile = "./ExploratoryDataAnalysis/household_power_consumption.zip", exdir = "./ExploratoryDataAnalysis")
powerdata <- read.csv("./ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")


### Subsetting and creating a datetime variable
powerdata_2days <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(powerdata_2days$Date, powerdata_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


### Code for plot 4
par(mfrow = c(2, 2), mar=c(4,4,2,2))

plot(datetime, powerdata_2days$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, powerdata_2days$Voltage, type="l", ylab="Voltage (Volt)")

plot(datetime, powerdata_2days$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, powerdata_2days$Sub_metering_2, type="l", col="red")
lines(datetime, powerdata_2days$Sub_metering_3, type="l", col="blue")
legend("topright", y=30, lwd=2, col=c("black", "red", "blue"),  bty="n", cex=.8, y.intersp = 0.6, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, powerdata_2days$Global_reactive_power, type="l", ylab="Global_reactive_power")


dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
