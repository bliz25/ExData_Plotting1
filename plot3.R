#Exploratory Data Analysis
#Plot 3

#Plot of Sub metering 1,2 and 3 from Household power consumption (2007-02-01 to 2007-02-02)

library(dplyr)

#Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset data from 2007-02-01 to 2007-02-02
subset <- data %>% 
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
    filter(Date >= "2007-02-01" & Date < "2007-02-03")

#Save as png file
png("plot3.png", width = 480, height = 480)

#Plot 
with(subset, plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset, lines(Date, Sub_metering_2, col = "red"))
with(subset, lines(Date, Sub_metering_3, col = "blue"))

#Legend
legend("topright", c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ") ,lty=c(1,1), lwd=c(1,1),  col=c("black","red","blue"))

#Close connection
dev.off()