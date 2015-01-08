##setwd("D:/_home/Coursera/Exploratory Data Analysis/W1")
data <- read.csv("household_power_consumption.txt", sep=';')

## convert dates
## data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## filter data
data12 = data[data$Date =='1/2/2007' | data$Date=='2/2/2007', ]

## Draw the plot
data12$tmp <- paste(data12$Date, data12$Time, sep=" ")
data12$timestamp <- strptime(data12$tmp, "%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
with(data12, {
  plot(data12$timestamp, as.numeric(as.character(data12$Sub_metering_1)), type="l",  col="black", xlab="", ylab="Energy sub metering", main="")
  lines(data12$timestamp, as.numeric(as.character(data12$Sub_metering_2)), type="l",  col="red", xlab="", ylab="Energy sub metering")
  lines(data12$timestamp, as.numeric(as.character(data12$Sub_metering_3)), type="l",  col="blue", xlab="", ylab="Energy sub metering")
})

dev.off()
