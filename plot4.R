setwd("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1")
dir.create("Project1data")

data <- read.table("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1/Project1data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

##We will only be using data from the dates 2007-02-01 and 2007-02-02
critical_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#Create date variable that is class posixt 
Date <- strptime(paste(critical_data$Date, critical_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Check class of variables of interest change to numeric
Global_active_power <- as.numeric(critical_data$Global_active_power)
Voltage <- as.numeric(critical_data$Voltage)
Sub_metering_1 <- as.numeric(critical_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(critical_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(critical_data$Sub_metering_3)
Global_reactive_power <- as.numeric(critical_data$Global_reactive_power)

#Make/Save Graph to png
png("plot4.png", width=480, height=480)

##Set parameters of graph
par(mfrow= c(2,2))

##Make graphs 

plot(Date, Global_active_power, type = "l")
plot(Date, Voltage, type = "l")
plot(Date, Sub_metering_1, type="l", ylab="Energy Sub metering")
lines(Date, Sub_metering_2, type="l", col="red")
lines(Date, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
plot(Date, Global_reactive_power, type = "l")

dev.off()