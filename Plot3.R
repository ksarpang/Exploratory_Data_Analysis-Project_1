# Coursera Data Science: Exploratory Data Analysis
# Course Project 1: Plot3
# Kishan Sarpangala Bhat
################################################################################
# Reading the file household_power_consumption.txt

Data <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

Power <- subset(Data,Data$Date=="1/2/2007" | Data$Date =="2/2/2007")

# Transforming the Date and Time variables to objects 

Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
Power$Time <- strptime(Power$Time, format="%H:%M:%S")
Power[1:1440,"Time"] <- format(Power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Power[1441:2880,"Time"] <- format(Power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot Functions

plot(Power$Time,Power$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
with(Power,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(Power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(Power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

# Naming the Graph -> saved the plot from/via the tool

title(main="Energy sub-metering")

