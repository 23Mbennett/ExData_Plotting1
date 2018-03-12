setwd("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1")
dir.create("Project1data")

data <- read.table("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1/Project1data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
View(data)


##We will only be using data from the dates 2007-02-01 and 2007-02-02
critical_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
View(critical_data)

#Check class of variable of interest change to numeric
class(critical_data$Global_active_power)
##[1] "character"
Global_Active_Power <- as.numeric(critical_data$Global_active_power)

#Create date variable that is class posixt 
Date <- strptime(paste(critical_data$Date, critical_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Save/make graph 
png("plot2.png", width=480, height=480)
plot(Date, Global_Active_Power, type = "l", ylab = "Global Active Power (Kilowatts)")
dev.off()
