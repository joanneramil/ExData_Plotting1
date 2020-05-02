#R code for Exploratory Data Analysis assignment 1 - Plot 2

library(lubridate)
library(dplyr)

#Importing dataset into R
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
#Extracting data from relevant dates
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)


#Creating Plot 2
(with(data_sub, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
}))
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
