dataFile <- "household_power_consumption.txt"

myData <- read.table(file = dataFile,
                     header = TRUE,
                     sep = ";",
                     dec = ".",
                     na.strings = "?")

vectorFilter <- myData$Date %in% c("1/2/2007", "2/2/2007")


# Plot 1
dataPlot1 <- myData[vectorFilter, 3]
png(file = "plot1.png", 
    width = 480, height = 480, units = "px")
par("mfcol" = c(1,1))
hist(x = dataPlot1,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.off()
