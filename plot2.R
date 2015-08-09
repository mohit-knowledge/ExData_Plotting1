library(dplyr)

## Unzip the downloaded file and read the data
unzip("./exdata-data-household_power_consumption.zip")
data <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?")

## Convert Date variable to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data for dates 2007-02-01 and 2007-02-02
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

## Add Date_time variable using Date and Time variables
datetime <- paste(as.character(data$Date), data$Time)
data$Date_time <- as.POSIXct(strptime(datetime, "%Y-%m-%d %H:%M:%S"))

## Create Plot 2
plot(data$Global_active_power ~ data$Date_time,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Save the plot to file 
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
