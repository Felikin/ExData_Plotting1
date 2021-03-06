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
#plot
dev.set(3)
png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 4, 4))
plot(df$Time, df$Global_active_power, xlab = "", ylab = "Global active power", type = "l")
plot(df$Time, df$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l")
plot(df$Time, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
legend("topright" ,legend = c("sub metering 1", "sub metering 2", "sub metering 3"), col =  c("black", "red", "blue"), lwd = 1, cex = 0.8)
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
plot(df$Time, df$Global_reactive_power, xlab = "datetime", ylab = "Global reactive power", type = "l")
dev.off()
