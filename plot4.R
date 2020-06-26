library(dplyr)


#read table & subset /prep relevant data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, (Date == '1/2/2007' | Date == '2/2/2007'))
data <- data %>% 
  as_tibble() %>%
  mutate(dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
  mutate(Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
  mutate(Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
  mutate(Global_active_power = as.numeric(Global_active_power)) %>%
  mutate(Voltage = as.numeric(Voltage)) %>%
  mutate(Global_reactive_power = as.numeric(Global_reactive_power))


#create png file
png(filename = "plot4.png")

#set parameter
par(mfrow = c(2,2))

#plot 1
plot(data$dateTime, data$Global_active_power, type = 'l', xlab="", 
     ylab="Global Active Power")

#plot 2
plot(data$dateTime, data$Voltage, type = 'l', xlab="datetime", 
     ylab="Voltage")

#make plot 3
plot(data$dateTime, data$Sub_metering_1, type = 'l', xlab="", 
     ylab="Energy Sub Metering")
points(data$dateTime, data$Sub_metering_2, col = "red", type = 'l')
points(data$dateTime, data$Sub_metering_3, col = "blue", type = 'l')

#make legend
legend("topright",legend = c('Sub_metering_1', 'Sub_metering_2', 
                             'Sub_metering_3'), col = c('black', 'red', 'blue'),
       lty = 1, bty = 'n', cex=.5)

#plot 4
plot(data$dateTime, data$Global_reactive_power, type = 'l', xlab="datetime", 
     ylab="Global_reactive_power")

#off dev
dev.off()