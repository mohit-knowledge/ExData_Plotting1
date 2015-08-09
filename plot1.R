library(dplyr)

## Unzip the downloaded file and read the data
unzip("./exdata-data-household_power_consumption.zip")
data <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?")

## Convert Date variable to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data for dates 2007-02-01 and 2007-02-02
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

## Create Plot 1
hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "Red")

## Save the plot to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
