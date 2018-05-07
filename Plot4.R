# Coursera Data Science: Exploratory Data Analysis
# Course Project 1: Plot3
# Kishan Sarpangala
################################################################################
# Reading the file household_power_consumption.txt --> Get the full dataset

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting the dates
data_time <- paste(as.Date(data$Date), data$Time)
data$data_time <- as.POSIXct(data_time)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~data_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~data_time, type="l", 
       ylab="Voltage (Volt)", xlab="")
  
  plot(Sub_metering_1~data_time, type="l", 
       ylab="Global Active Power (Kilowatts)", xlab="")
  
  lines(Sub_metering_2~data_time,col='Red')
  
  lines(Sub_metering_3~data_time,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  
  plot(Global_reactive_power~data_time, type="l", 
       ylab="Global Rective Power (Kilowatts)",xlab="")
})

## Save the image/file as png. This will be automatically saved in the working area. 
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()

