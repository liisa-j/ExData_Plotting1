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


### Code for plot 3
plot(datetime, powerdata_2days$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, powerdata_2days$Sub_metering_2, type="l", col="red")
lines(datetime, powerdata_2days$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()