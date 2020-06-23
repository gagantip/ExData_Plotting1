library(graphics)

#reading raw data
raw_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =F,
                       na.strings="?", nrows=2075259, check.names=F)
#extracting required data from the raw data
req_data <- subset(raw_data, Date %in% c("1/2/2007", "2/2/2007"))
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")

#saving the plot  in a png file
png("plot1.png", width=480, height=480)
# Plotting the data
hist(req_data$Global_active_power,col="red", 
     main="Global Active Poweer", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()