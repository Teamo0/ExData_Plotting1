# Script to create figure plot1.png

# read in data and subset relevant days
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
data <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

# change to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot histogram
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

#save .png file
dev.copy(png,'plot1.png')
dev.off()