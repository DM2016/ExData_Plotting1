#Exploratory data analysis:
#Peer-graded Assignment: Course Project 1 plot2

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

#III. Set up plot 2

#variables plotted
timevar <- strptime(paste(epc1$Date, epc1$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
gap1 <- as.numeric(epc1$Global_active_power)

#plot the graph
mypngpath <- file.path(out.dir, paste("plot2.png", sep = ""))
png(file = mypngpath, width=480, height=480)
plot(timevar, gap1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




