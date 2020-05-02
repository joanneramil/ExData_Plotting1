#R code for Exploratory Data Analysis assignment 1 - Plot 1

#Importing dataset into R
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
#Extracting data from relevant dates
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%y")
data_sub$Time <- as.Date(data_sub$Time, "hh:mm:ss")

#Creating Plot 1
hist(data_sub$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
