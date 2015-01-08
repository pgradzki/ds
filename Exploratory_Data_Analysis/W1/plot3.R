##setwd("D:/_home/Coursera/Exploratory Data Analysis/W1")
data <- read.csv("household_power_consumption.txt", sep=';')

## prepare data
data$tmp <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$timestamp <- strptime(data$tmp, "%d/%m/%Y %H:%M:%S")

## filter data
data12 = data[data$Date =='2007-02-01' | data$Date=='2007-02-02', ]

## Draw the plot
Sys.setlocale("LC_TIME", "English")

png(file="plot3.png", width=480, height = 480)
with(data12, {
  plot(data12$timestamp, as.numeric(as.character(data12$Sub_metering_1)), type="l",  col="black", xlab="", ylab="Energy sub metering", main="")
  lines(data12$timestamp, as.numeric(as.character(data12$Sub_metering_2)), type="l",  col="red", xlab="", ylab="Energy sub metering")
  lines(data12$timestamp, as.numeric(as.character(data12$Sub_metering_3)), type="l",  col="blue", xlab="", ylab="Energy sub metering")
})

dev.off()
