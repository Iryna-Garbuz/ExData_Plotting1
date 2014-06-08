  setwd("~/R-programming/Exploratory analysis")

## Get column names from text file
  cols.names <- readLines("household_power_consumption.txt", n=1)

## Get only rows where data from the dates 2007-02-01 and 2007-02-02
  rows.data <- grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt", n= 207259))

## Read data from file limited by specific rows
  data <- read.table ("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?",
                    skip=rows.data[1]-1, nrows=length(rows.data))

  names(data) <- unlist (strsplit(cols.names, split = ";"))

  ##print (head(data))

## Convert the Date variable to Date class
  data$Date <- as.Date(data$Date, format = "%d/%m/%y")

## Plot and save into png
  png (filename = "plot1.png", width = 480, height= 480)
  
  hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", main = "Global Active Power")
  
  dev.off()
