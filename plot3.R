setwd("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1")
dir.create("Project1data")

data <- read.table("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1/Project1data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")


##We will only be using data from the dates 2007-02-01 and 2007-02-02
critical_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
View(critical_data)

#Check class of variables of interest change to numeric
class(critical_data$Sub_metering_1)
##[1] "character"
Sub_metering_1 <- as.numeric(critical_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(critical_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(critical_data$Sub_metering_3)
Global_active_power <- as.numeric(critical_data$Global_active_power)

#Create date variable that is class posixt 
Date <- strptime(paste(critical_data$Date, critical_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Make/Save Graph to png
png("plot3.png", width=480, height=480)
plot(Date, Sub_metering_1, type="l", ylab="Energy Sub metering")
lines(Date, Sub_metering_2, type="l", col="red")
lines(Date, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
