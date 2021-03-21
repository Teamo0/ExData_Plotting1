# Script to create figure plot3.png

# read in data and subset relevant days
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# change to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# create figure plot2
par(pty="s")
plot(seq(1,length(data$Time)),data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
points(seq(1,length(data$Time)),data$Sub_metering_2,type = "l", col = "red")
points(seq(1,length(data$Time)),data$Sub_metering_3,type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

#save .png file
dev.copy(png,'plot3.png')
dev.off()

