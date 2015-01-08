##setwd("c:/projects/DataScience/ExploratoryDataAnalysis/W1")
data <- read.csv("household_power_consumption.txt", sep=';')

## convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## filter data
data12 = data[data$Date =='1/2/2007' | data$Date=='2/2/2007', ]

## Prepare data
data12$tmp <- paste(data12$Date, data12$Time, sep=" ")
data12$timestamp <- strptime(data12$tmp, "%d/%m/%Y %H:%M:%S")

## Draw the plot
png(file="plot2.png")
with(data12, plot(data12$timestamp, as.numeric(as.character(Global_active_power)), type="l",  xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()


