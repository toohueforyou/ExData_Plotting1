library(dplyr)


#read table & subset /prep relevant data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, (Date == '1/2/2007' | Date == '2/2/2007'))
data <- data %>% 
  as_tibble() %>%
  mutate(dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Sub_metering_1 = as.numeric(Sub_metering_1))
  mutate(Sub_metering_2 = as.numeric(Sub_metering_2))
  mutate(Sub_metering_3 = as.numeric(Sub_metering_3))

#create png file
png(filename = "plot3.png")

#make linechart
plot(data$dateTime, data$Sub_metering_1, type = 'l', xlab="", 
     ylab="Energy Sub Metering")
points(data$dateTime, data$Sub_metering_2, col = "red", type = 'l')
points(data$dateTime, data$Sub_metering_3, col = "blue", type = 'l')

#make legend
legend("topright",legend = c('Sub_metering_1', 'Sub_metering_2', 
        'Sub_metering_3'), col = c('black', 'red', 'blue'),
       lty = 1)

#off dev
dev.off()