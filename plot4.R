rm(list=ls())

library(dplyr)

# load data 
data<- read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)
data<- data %>% filter(data$Date=="1/2/2007" | data$Date=="2/2/2007") %>% mutate(Date = as.Date(Date, '%d/%m/%Y')) %>% mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S')))

#make plot 4
par(mfrow = c(2, 2))
plot(data$Time,data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$Time,data$Voltage,type="l",ylab = "Voltage", xlab = "datetime")

plot(data$Time,data$Sub_metering_1,type="l",col="black",ylab = "Enegy sub metering", xlab = "")
points(data$Time,data$Sub_metering_2,type="l",col="red")
points(data$Time,data$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, box.lty = 0, cex = 0.5, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time,data$Global_reactive_power,type="l",ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()