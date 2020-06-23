raw_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(raw_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
req_data <- subset(raw_data,raw_data$Date=="1/2/2007" | raw_data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
req_data$Time <- strptime(req_data$Time, format="%H:%M:%S")
req_data[1:1440,"Time"] <- format(req_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
req_data[1441:2880,"Time"] <- format(req_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plotting the data 
#Graph 1
plot(req_data$Time,as.numeric(as.character(req_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#Graph 2
plot(req_data$Time,as.numeric(as.character(req_data$Voltage)),type="l",xlab="datetime",ylab="Voltage") 

#Graph 3 
plot(req_data$Time, req_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(req_data, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(req_data, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
with(req_data, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Graph 4
plot(req_data$Time,as.numeric(as.character(req_data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power") 

#Closing graphics device
dev.off()