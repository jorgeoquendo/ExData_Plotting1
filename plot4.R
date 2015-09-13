# Import data file
epc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
# New variable with date and time in date/time class
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %T" )

# subset the specified dates
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epcr <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

#make plot4.png
par(mfrow = c(2,2))

par(mar = c(4,4, 2, 4))
plot(epcr$DateTime, epcr$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")


par(mar = c(4,4, 2, 4))
plot(epcr$DateTime, epcr$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


par(mar = c(4,4, 2, 4))
plot(epcr$DateTime, epcr$Sub_metering_1, type = "l", col = "black",xlab = "", ylab = "Energy sub metering")
lines(epcr$DateTime, epcr$Sub_metering_2, col = "red")    
lines(epcr$DateTime, epcr$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .8, text.width = 100000, bty = "n")

par(mar = c(4,4, 2, 4))
plot(epcr$DateTime, epcr$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
