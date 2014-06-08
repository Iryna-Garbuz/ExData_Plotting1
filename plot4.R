setwd("~/R-programming/Exploratory analysis")

## Get column names from text file
cols.names <- readLines("household_power_consumption.txt", n=1)

## Get only rows where data from the dates 2007-02-01 and 2007-02-02
rows.data <- grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt", n= 207259))

## Read data from file limited by specific rows
data <- read.table ("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?",
                    skip = rows.data[1]-1, nrows = length(rows.data))

names(data) <- unlist (strsplit(cols.names, split = ";"))

## Convert the Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%y")

## Plot and save into png
png (filename = "plot4.png", width = 480, height= 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

  ##plot1
  plot(data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", 
       xaxt = "n")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
  
  ##plot2
  plot(data$Voltage, type = "l", xlab = "datatime", ylab = "Voltage",, xaxt="n")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
  
 ##plot3 
  plot(data$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
  lines(data$Sub_metering_1)
  lines(data$Sub_metering_2, col="red")
  lines(data$Sub_metering_3, col="blue")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
 ##plot4

 plot(data$Global_reactive_power, type = "l", xlab = "datatime", ylab = "CLonbal_reactive_power", , xaxt="n")
 axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

dev.off()