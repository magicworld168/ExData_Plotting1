setwd("D:/Coursera/Exploratory Data")

library(dplyr)

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

#1.Global Active Power
hist(power_cons$Global_active_power, col ='red',xlab = 'Global Active Power(kilowatts)', main ='Global Active Power')
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
