#setwd("D:/_home/Coursera/Exploratory Data Analysis/W1")

## Load data
data <- read.csv("household_power_consumption.txt", sep=';')

## convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## filter data
data12 = data[data$Date =='2007-02-01' | data$Date=='2007-02-02', ]

## Draw the plot
png(file="plot1.png", width = 480, height = 480)
with(data12, hist(as.numeric(as.character(Global_active_power)), col="red",  xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()

