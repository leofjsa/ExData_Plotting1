dataFile <- "household_power_consumption.txt"

myData <- read.table(file = dataFile,
                     header = TRUE,
                     sep = ";",
                     dec = ".",
                     na.strings = "?")

vectorFilter <- myData$Date %in% c("1/2/2007", "2/2/2007")


# Plot 3
dataPlot3 <- myData[vectorFilter, c(1:2, 7:9)]
dataPlot3 <- data.frame("date_time" = strptime(x = paste(dataPlot3[,1], 
                                                         dataPlot3[, 2]), 
                                               format = "%d/%m/%Y %H:%M:%S"), 
                        dataPlot3[,3:5])

Sys.setlocale(category = "LC_ALL", locale = "C")

png(file = "plot3.png", width = 480, height = 480, units = "px")
par("mfcol" = c(1,1))

plot(x = dataPlot3[,1], y = dataPlot3[,2], type = "n", 
     main = "", xlab = "", ylab = "Energy sub metering")
lines(x = dataPlot3[,1], y = dataPlot3[,2], col = "black")
lines(x = dataPlot3[,1], y = dataPlot3[,3], col = "red")
lines(x = dataPlot3[,1], y = dataPlot3[,4], col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.off()