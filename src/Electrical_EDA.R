
#To filter I could use:

#eletrical_data <- read.table("C:\\Users\\leandro.mora\\Projects\\DSTraining\\Datasets\\household_power_consumption.txt", header=TRUE, sep=";")

#dtv <- as.Date(c("2007-02-01", "2007-02-02"))

#fdf <- filter(power, as.Date(Date, "%m/%d/%Y" ) %in% (dtv))

#The data was filtered by date previously
filtered_eletrical_data <- read.csv("C:\\Users\\leandro.mora\\Projects\\DSTraining\\Datasets\\electrical_data_filtered.csv", header=TRUE)

# Plot 1
par(mfrow= c(1,1))
hist(filtered_eletrical_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,'C:\\Users\\leandro.mora\\Projects\\DSTraining\\ExploratoryDataAnalysis\\ExData_Plotting1\\plots\\plot1.png')
dev.off()

# Plot 2
filtered_eletrical_data$dtime=as.POSIXct(paste (filtered_eletrical_data$Date,filtered_eletrical_data$Time), format="%d/%m/%Y %H:%M:%S")

plot(Global_active_power ~ dtime, filtered_eletrical_data, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,'C:\\Users\\leandro.mora\\Projects\\DSTraining\\ExploratoryDataAnalysis\\ExData_Plotting1\\plots\\plot2.png')
dev.off()


# Plot 3

with(filtered_eletrical_data,plot(dtime, Sub_metering_1, type="n", ylab="Energy submetering", xlab=""))

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_1, type="l")  

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_2, type="l", col="red")

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_3, type="l", col="blue")

legend("topright",lty = 1, col= c("Black","RED", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.copy(png,'C:\\Users\\leandro.mora\\Projects\\DSTraining\\ExploratoryDataAnalysis\\ExData_Plotting1\\plots\\plot3.png')
dev.off()
# Plot 4

par(mfrow = c(2,2))

hist(filtered_eletrical_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")

filtered_eletrical_data$dtime=as.POSIXct(paste (filtered_eletrical_data$Date,filtered_eletrical_data$Time), format="%d/%m/%Y %H:%M:%S")

plot(Global_active_power ~ dtime, filtered_eletrical_data, type="l",ylab="Global Active Power (kilowatts)", xlab="")


with(filtered_eletrical_data,plot(dtime, Sub_metering_1, type="n", ylab="Energy submetering", xlab=""))

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_1, type="l")  

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_2, type="l", col="red")

lines(filtered_eletrical_data$dtime, filtered_eletrical_data$Sub_metering_3, type="l", col="blue")


plot(Global_reactive_power ~ dtime, filtered_eletrical_data, type="l",ylab="Global Reactive Power (kilowatts)", xlab="")

dev.copy(png,'C:\\Users\\leandro.mora\\Projects\\DSTraining\\ExploratoryDataAnalysis\\ExData_Plotting1\\plots\\plot4.png')
dev.off()
