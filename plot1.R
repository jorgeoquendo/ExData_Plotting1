# Import data file
epc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
# New variable with date and time in date/time class
epc$DateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %T" )

# subset the specified dates
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epcr <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

# make plot1.png
hist(epcr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
