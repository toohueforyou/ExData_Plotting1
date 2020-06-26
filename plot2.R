library(dplyr)


#read table & subset /prep relevant data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(data, (Date == '1/2/2007' | Date == '2/2/2007'))
data <- data %>% 
  as_tibble() %>%
  mutate(dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

#create png file
png(filename = "plot2.png")

#make linechart
plot(data$dateTime, data$Global_active_power, type = 'l', xlab="", 
     ylab="Global Active Power (kilowatts)")

#off dev
dev.off()