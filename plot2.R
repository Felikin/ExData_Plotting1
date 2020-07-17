#read data
df <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                 skip = 66638, nrows = 2880, sep = ";",
                 col.names = c("Date", "Time", 
                               "Global_active_power", 
                               "Global_reactive_power", 
                               "Voltage", "Global_intensity", 
                               "Sub_metering_1", "Sub_metering_2", 
                               "Sub_metering_3"))
df$Time <- paste(df$Date,df$Time)
#changing time class
df$Time <- strptime(df$Time, "%d/%m/%Y %H:%M:%S")
#changing date class
df$Date <- as.Date(df$Date, "%d/%m/%y")
#plot the gab vs time
plot(df$Time, df$Global_active_power, type="l", main = "", 
     xlab = "", ylab = "Global active power")
dev.copy(png, file = "plot2.png")
dev.off()

