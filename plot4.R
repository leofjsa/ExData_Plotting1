dataFile <- "household_power_consumption.txt"

myData <- read.table(file = dataFile,
                     header = TRUE,
                     sep = ";",
                     dec = ".",
                     na.strings = "?")

vectorFilter <- myData$Date %in% c("1/2/2007", "2/2/2007")


# Plot 4
dataPlot4 <- data.frame("date_time" = strptime(x = paste(myData[vectorFilter, 1], 
                                                         myData[vectorFilter, 2]), 
                                               format = "%d/%m/%Y %H:%M:%S"), 
                        myData[vectorFilter,])

Sys.setlocale(category = "LC_ALL", locale = "C")

png(file = "plot4.png", width = 480, height = 480, units = "px")
par("mfcol" = c(2,2))

# Plot 4.a
plot(x = dataPlot4[,1], 
     y = dataPlot4[,4], 
     type = "l", 
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Plot 4.b
plot(x = dataPlot4[,1], y = dataPlot4[,8], type = "n", 
     main = "", xlab = "", ylab = "Energy sub metering")
lines(x = dataPlot4[,1], y = dataPlot4[,8], col = "black")
lines(x = dataPlot4[,1], y = dataPlot4[,9], col = "red")
lines(x = dataPlot4[,1], y = dataPlot4[,10], col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), 
       bty = "n")

# Plot 4.c
plot(x = dataPlot4[,1], 
     y = dataPlot4[,6], 
     type = "l", 
     main = "", 
     xlab = "datetime",
     ylab = "Voltage")

# Plot 4.d
plot(x = dataPlot4[,1], 
     y = dataPlot4[,5], 
     type = "l", 
     main = "", 
     xlab = "datetime",
     ylab = "Global_reactive_power")


dev.off()


