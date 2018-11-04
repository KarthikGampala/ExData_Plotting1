data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date <- dmy(as.character(data$Date))
data$Time <- chron(times=as.character(data$Time))
data1 <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02" ,]


data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Sub_metering_1      <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2      <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3      <- as.numeric(as.character(data1$Sub_metering_3))
data1$Voltage             <- as.numeric(as.character(data1$Voltage))
data1                     <- transform(data1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))


#plot1
plot(data1$timestamp,data1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#plot2
plot(data1$timestamp,data1$Voltage,type="l",ylab="Voltage",xlab="datetime")

#plot3
plot(data1$timestamp,data1$Sub_metering_1,type="l",ylab="Energy Sub metering",xlab="")
lines(data1$timestamp,data1$Sub_metering_2,type="l",col="red")
lines(data1$timestamp,data1$Sub_metering_3,type="l",col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#plot4
plot(data1$timestamp,data1$Global_reactive_power,type="l",ylab="Global_Reactive_Power",xlab="datetime")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
dev.off()
