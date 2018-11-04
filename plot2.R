data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date <- dmy(as.character(data$Date))
data$Time <- chron(times=as.character(data$Time))
data1 <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02" ,] 
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1 <- transform(data1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
png(file="plot2.png",height =480 ,width=480)
plot(data1$timestamp,data1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()