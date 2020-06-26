#read table & subset relevant data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, (Date == '1/2/2007' | Date == '2/2/2007'))


#create png file
png(filename = "plot1.png")

#make histogram
hist(as.numeric(data$Global_active_power), col = 'red', 
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', 
     main = 'Global Active Power')

#off dev
dev.off()