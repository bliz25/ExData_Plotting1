#Exploratory Data Analysis
#Plot 4

#Plot of Global active power from Household power consumption (2007-02-01 to 2007-02-02)

library(dplyr)

#Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset data from 2007-02-01 to 2007-02-02
subset <- data %>% 
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
    filter(Date >= "2007-02-01" & Date < "2007-02-03")

#Save as png file
png("plot4.png", width = 480, height = 480)

#Plots 

par(mfrow = c(2,2))

#Plot 1
with(subset, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Plot 2
with(subset, plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Plot 3
with(subset, plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset, lines(Date, Sub_metering_2, col = "red"))
with(subset, lines(Date, Sub_metering_3, col = "blue"))
#Legend
legend("topright", c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ") , lty=c(1,1),  bty="n", cex=.5,  col=c("black","red","blue"))

#Plot 4
with(subset, plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

#Close connection
dev.off()