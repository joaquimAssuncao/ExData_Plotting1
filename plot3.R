#
#---This function plot a chart of Sub meterings from
# "household_power_consumption" some days period
# Just be sure that the file is in your current directory.
#

library(lubridate)
Plot3 <- function() {
  #dmy identify Day Month and Year, then as.Date convert to a date format
  #Columns 1:3 are selected (Date, Time and G.Active Power)
  hpc <- read.csv("~/household_power_consumption.txt", sep=";");
  relevant <- hpc[as.Date(dmy(hpc$Date)) == as.Date("2007-02-01") | as.Date(dmy(hpc$Date)) == as.Date("2007-02-02"),c(1,2,7,8,9)]
  relevant$Date <- dmy(relevant$Date)
  relevant_dt <- paste(relevant$Date,relevant$Time)
  plot(ymd_hms(relevant_dt),as.numeric(as.character(relevant$Sub_metering_1)),type="l",xlab="" ,ylab="Energy sub metering")
  lines(ymd_hms(relevant_dt),as.numeric(as.character(relevant$Sub_metering_2)), type="l", col="red")
  lines(ymd_hms(relevant_dt),as.numeric(as.character(relevant$Sub_metering_3)), type="l", col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="---", col=c("black","red","blue"));
}