#R code for Exploratory Data Analysis assignment 1 - Plot 4

library(lubridate)
library(dplyr)

#Importing dataset into R
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
#Extracting data from relevant dates
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)


#Creating Plot 4
##Setting margins
par(mfrow=c(2,2), mar=c(4,4,2,1))
##First plot - top-left
(with(data_sub, {
  plot(Global_active_power~Datetime, type ="l",
       ylab="Global Active Power", xlab="")
})) 
##Second plot - top-right
(with(data_sub, {
  plot(data_sub$Voltage~data_sub$Datetime, type = "l",
       ylab="Voltage", xlab="datetime")
})) 
##Third plot - bottom-left
(with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
legend("topright", 
       col=c("black", "red", "blue"), 
       lty=c(1,1), 
       lwd=c(1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}))
##Fourth plot - bottome-right
(with(data_sub, {
  plot(Global_reactive_power~Datetime, type = "l",
       ylab="Global_reactive_power", xlab="datetime")
}))

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
