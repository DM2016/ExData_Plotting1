#Exploratory data analysis:
#Peer-graded Assignment: Course Project 1 plot4

#Instructions:

#I. Set up libraries and directories

library(tidyverse)
library(data.table)
library(lubridate)
library(arsenal)
library(gridExtra)

in.dir <- file.path("D:/Docker/Exploratory_data_analysis/exdata_data_household_power_consumption")
out.dir <- file.path("D:/Docker/Exploratory_data_analysis/results")

#II.load saved filtered file from plot1.R

epc1 <- readRDS(file = file.path(in.dir, "epc1.rds"))
epc1 <- as.data.frame(epc1)
head(epc1)
str(epc1)

#III. Set up plot 4
#collect variables
timevar <- strptime(paste(epc1$Date, epc1$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
gap1 <- as.numeric(epc1$Global_active_power)
grp1 <- as.numeric(epc1$Global_reactive_power)
volt <- as.numeric(epc1$Voltage)
sm1 <- as.numeric(epc1$Sub_metering_1)
sm2 <- as.numeric(epc1$Sub_metering_2)
sm3 <- as.numeric(epc1$Sub_metering_3)

mypngpath <- file.path(out.dir, paste("plot4.png", sep = ""))
png(file = mypngpath, width=480, height=480)
par(mfrow=c(2,2))
plot(timevar, gap1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(timevar, volt, type="l", xlab="", ylab="Voltage")
plot(timevar, sm1, col = "black", type="l", xlab="", ylab="Energy Sub Metering")
lines(timevar, sm2, col = "red", type="l", lty = 2)
lines(timevar, sm3, col = "blue", type="l", lty = 3)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty = 1:2, cex=0.8)
plot(timevar, grp1, type="l", xlab="", ylab="Global_Reactive_Power")
dev.off()



