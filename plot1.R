data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date <- dmy(as.character(data$Date))
data$Time <- chron(times=as.character(data$Time))
data1 <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02" ,] 
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
png(file="plot1.png")
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
