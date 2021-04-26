#Exploratory data analysis:
#Peer-graded Assignment: Course Project 1 plot 1

#Instructions:

#I. Set up libraries and directories

library(tidyverse)
library(data.table)
library(lubridate)
library(arsenal)
library(gridExtra)

in.dir <- file.path("D:/Docker/Exploratory_data_analysis/exdata_data_household_power_consumption")
out.dir <- file.path("D:/Docker/Exploratory_data_analysis/results")

#II. Read in Data File
epc0 <- read.table(file.path(in.dir, "household_power_consumption.txt"),
                       header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = "." )
dim(epc0)
names(epc0)
str(epc0)

#III. Data Cleaning/Formating
#only need data from the dates 2007-02-01 and 2007-02-02.

head(epc0$Date)

epc0$Date <-as.Date(epc0$Date,"%d/%m/%Y")

epc1 <- epc0 %>%
  filter(Date == as.Date("2007-02-01")| Date == as.Date("2007-02-02"))

head(epc1)
str(epc1$Date)

#III. Set up the Exploratory Data Graph for Plot 1
mypngpath <- file.path(out.dir, paste("plot1.png", sep = ""))
png(file = mypngpath, width=480, height=480)
hist(as.numeric(epc1$Global_active_power),
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power")
dev.off()

#IV. Save epc1 data as RDS file for future use.
saveRDS(epc1, file = file.path(in.dir, "epc1.rds"))





