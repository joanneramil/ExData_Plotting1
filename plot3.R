#R code for Exploratory Data Analysis assignment 1 - Plot 3

library(lubridate)
library(dplyr)

#Importing dataset into R
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
#Extracting data from relevant dates
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)


#Creating Plot 3
(with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
}))
legend("topright", 
       col=c("black", "red", "blue"), 
       lty=c(1,1), 
       lwd=c(1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
