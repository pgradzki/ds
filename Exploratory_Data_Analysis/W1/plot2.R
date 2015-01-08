##setwd("c:/projects/DataScience/ExploratoryDataAnalysis/W1")
data <- read.csv("household_power_consumption.txt", sep=';')

## prepare data
data$tmp <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$timestamp <- strptime(data$tmp, "%d/%m/%Y %H:%M:%S")

## filter data
data12 = data[data$Date =='2007-02-01' | data$Date=='2007-02-02', ]

## Draw the plot
png(file="plot2.png", width = 480, height = 480)
with(data12, plot(data12$timestamp, as.numeric(as.character(Global_active_power)), type="l",  xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()


