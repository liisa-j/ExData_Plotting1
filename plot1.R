### Reading in the data
# Sys.setlocale("LC_TIME", "C")

if(!file.exists("./ExploratoryDataAnalysis")){dir.create("./ExploratoryDataAnalysis")}
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./ExploratoryDataAnalysis/household_power_consumption.zip")
unzip(zipfile = "./ExploratoryDataAnalysis/household_power_consumption.zip", exdir = "./ExploratoryDataAnalysis")

powerdata <- read.csv("./ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")
powerdata_2days <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]



### Code for plot 1
hist(powerdata_2days$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()