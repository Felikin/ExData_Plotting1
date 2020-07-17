#read data
df <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                 skip = 66638, nrows = 2880, sep = ";",
                 col.names = c("Date", "Time", 
                               "Global_active_power", 
                               "Global_reactive_power", 
                               "Voltage", "Global_intensity", 
                               "Sub_metering_1", "Sub_metering_2", 
                               "Sub_metering_3"))


#Make the plot
hist(df$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

#Copy to PNG
dev.copy(png, file = "plot1.png")
dev.off()

