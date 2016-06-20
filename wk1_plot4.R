setwd("D:/Coursera/Exploratory Data")

#Read in data
power_cons0<- read.table("household_power_consumption.txt", 
                         sep=";",dec=".",
                         header = TRUE, stringsAsFactors = FALSE
                         #colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

#Correct Data type 
power_cons <- within(power_cons0, DateTime <- paste(Date, Time))
power_cons$DateTime <- strptime(power_cons$DateTime, "%d/%m/%Y %H:%M:%S")

power_cons$Date=strptime(power_cons$Date, "%d/%m/%Y")
power_cons[,3]=as.numeric(power_cons[,3]) 
power_cons[,4]=as.numeric(power_cons[,4]) 
power_cons[,5]=as.numeric(power_cons[,5]) 
power_cons[,6]=as.numeric(power_cons[,6]) 
power_cons[,7]=as.numeric(power_cons[,7]) 
power_cons[,8]=as.numeric(power_cons[,8]) 
power_cons[,9]=as.numeric(power_cons[,9]) 


summary(power_cons)

power_cons <- subset(power_cons, Date >=as.POSIXlt("2007-02-01") & Date <= as.POSIXlt("2007-02-02") )

#Plot 
par(mfrow=c(2,2))

plot(x = power_cons$DateTime, y = power_cons$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x = power_cons$DateTime, y = power_cons$Voltage, type = "l",  xlab = "", ylab = "Voltage")

plot(x = power_cons$DateTime, y = power_cons$Sub_metering_1, type = "l",  col ='Black')
lines(x = power_cons$DateTime, y = power_cons$Sub_metering_1, type = "n",  xlab = "", ylab = "Energy sub metering")
lines(x = power_cons$DateTime, y = power_cons$Sub_metering_2, type = "l",  col='Red')
lines(x = power_cons$DateTime, y = power_cons$Sub_metering_3, type = "l",  col='Blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))   # lty = 1 -> solid line


plot(x = power_cons$DateTime, y = power_cons$Global_reactive_power, type = "l",  xlab = "", ylab = "Global_reactive_power")


dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()