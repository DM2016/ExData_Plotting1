#Exploratory data analysis:
#Peer-graded Assignment: Course Project 1 plot3

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

#III. Set up plot 3
#set up x vs y variables
#timevar vs submetering1, submetering2 and submetering3
timevar <- strptime(paste(epc1$Date, epc1$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
sm1 <- as.numeric(epc1$Sub_metering_1)
sm2 <- as.numeric(epc1$Sub_metering_2)
sm3 <- as.numeric(epc1$Sub_metering_3)

#timevar vs submetering3
mypngpath <- file.path(out.dir, paste("plot3.png", sep = ""))
png(file = mypngpath, width=480, height=480)
plot(timevar, sm1, col = "black", type="l", xlab="", ylab="Energy Sub Metering")
lines(timevar, sm2, col = "red", type="l", lty = 2)
lines(timevar, sm3, col = "blue", type="l", lty = 3)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty = 1:2, cex=0.8)
dev.off()


