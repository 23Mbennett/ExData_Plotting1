setwd("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1")
dir.create("Project1data")

data <- read.table("C:/Users/Miles/Desktop/datasciencecoursera_rep/Exploratory Data Plotting Project 1/Project1data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
View(data)


#We will only be using data from the dates 2007-02-01 and 2007-02-02
critical_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
View(critical_data)

#Make the Graph

#Check class of variable of interest
class(data$Global_active_power)
##[1] "character"

#change class to numeric
Global_active_power <- as.numeric(critical_data$Global_active_power)

#Construct the plot save it to a PNG file called "plot1.png" with a width of 480 pixels and height of 480 pixels
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
