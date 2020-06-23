raw_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(raw_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
req_data <- subset(raw_data,raw_data$Date=="1/2/2007" | raw_data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
req_data$Time <- strptime(req_data$Time, format="%H:%M:%S")
req_data[1:1440,"Time"] <- format(req_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
req_data[1441:2880,"Time"] <- format(req_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#opening the graphic device
png("plot2.png", width=480, height=480)


# calling the basic plot function
plot(req_data$Time,as.numeric(as.character(req_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

#closing the graphic device
dev.off()
