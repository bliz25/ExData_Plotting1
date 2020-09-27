#Exploratory Data Analysis
#Plot 1

#Histogram of Global active power from Household power consumption (2007-02-01 to 2007-02-02)

library(dplyr)

#Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset data from 2007-02-01 to 2007-02-02
subset <- data %>% 
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
    filter(Date >= "2007-02-01" & Date < "2007-02-03")

#Save as png file
png("plot1.png", width = 480, height = 480)

#Histogram
hist(subset$Global_active_power, main = "Global Active Power",  xlab= "Global Active Power (kilowatts)", col = "red")

#Close connection
dev.off()
