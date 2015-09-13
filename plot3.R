# Import data file
epc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
# New variable with date and time in date/time class
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %T" )

# subset the specified dates
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epcr <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

#make plot3.png
par(mar = c(2,4, 2, 1))
plot(epcr$DateTime, epcr$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering")
lines(epcr$DateTime, epcr$Sub_metering_2, col = "red")    
lines(epcr$DateTime, epcr$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .8, text.width = 45000)
dev.copy(png, file = "plot3.png")
dev.off()
