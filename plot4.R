# Script to create figure plot4.png

# read in data and subset relevant days
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
data <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

# change to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)

# define overall figure panel
par(mfcol = c(2,2),mar = c(5,2,2,0))
par(pty="s")

# create subfigure 1
plot(seq(1,length(data$Time)),data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# create subfigure 2
plot(seq(1,length(data$Time)),data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
points(seq(1,length(data$Time)),data$Sub_metering_2,type = "l", col = "red")
points(seq(1,length(data$Time)),data$Sub_metering_3,type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 0.8)

# create subfigure 3
plot(seq(1,length(data$Time)),data$Voltage,type = "l", ylab = "Voltage", xlab = "datetime",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# create subfigure 4
plot(seq(1,length(data$Time)),data$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datetime",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))


#save .png file
dev.copy(png,'plot4.png')
dev.off()
