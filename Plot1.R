# Coursera Data Science: Exploratory Data Analysis
# Course Project 1: Plot1
# Kishan Sarpangala
################################################################################
#Reading household_power_consumption.txt

household_power_file <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(household_power_file) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_power <- subset(household_power_file,household_power_file$Date=="1/2/2007" | household_power_file$Date =="2/2/2007")

#str(subSetData)
globalActivePower <- as.numeric(household_power_file$Global_active_power)
#Png file will be generated where ever you run this code. In the same directory
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="blue", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
