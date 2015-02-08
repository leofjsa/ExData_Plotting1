dataFile <- "household_power_consumption.txt"

myData <- read.table(file = dataFile,
                     header = TRUE,
                     sep = ";",
                     dec = ".",
                     na.strings = "?")

vectorFilter <- myData$Date %in% c("1/2/2007", "2/2/2007")


# Plot 2
dataPlot2 <- myData[vectorFilter, 1:3]
dataPlot2 <- data.frame("date_time" = strptime(x = paste(dataPlot2[,1], 
                                                         dataPlot2[, 2]), 
                                              format = "%d/%m/%Y %H:%M:%S"), 
                        "power" = dataPlot2[,3])

Sys.setlocale(category = "LC_ALL", locale = "C")

png(file = "plot2.png", 
    width = 480, height = 480, units = "px")
par("mfcol" = c(1,1))
plot(x = dataPlot2[,1], 
     y = dataPlot2[,2], 
     type = "l", 
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()