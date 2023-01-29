rm(list=ls())

library(dplyr)

# load data 
data<- read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)
data<- data %>% filter(data$Date=="1/2/2007" | data$Date=="2/2/2007") %>% mutate(Date = as.Date(Date, '%d/%m/%Y')) %>% mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S')))

#make plot 2
plot(data$Time,data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()