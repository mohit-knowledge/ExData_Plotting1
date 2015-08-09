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

## Create Plot 3 directly in png file to avoid legend getting cut off
png("plot3.png", width = 480, height = 480)
with(data, {
    plot(Sub_metering_1 ~ Date_time,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ Date_time,
          col = 'Red')
    lines(Sub_metering_3 ~ Date_time,
          col = 'Blue')
})
legend("topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1)
dev.off()
