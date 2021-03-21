# Script to create figure plot2.png

# read in data and subset relevant days
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# change to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# create figure plot2
par(pty="s")
plot(seq(1,length(data$Time)),data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

#save .png file
dev.copy(png,'plot2.png')
dev.off()

