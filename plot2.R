#Exploratory Data Analysis
#Plot 2

#Plot of Global active power from Household power consumption (2007-02-01 to 2007-02-02)

library(dplyr)

#Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset data from 2007-02-01 to 2007-02-02
subset <- data %>% 
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
    filter(Date >= "2007-02-01" & Date < "2007-02-03")

#Save as png file
png("plot2.png", width = 480, height = 480)

#Plot 
with(subset, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#Close connection
dev.off()