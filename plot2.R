#
#---This function plot a chart of Global Active Power from
# "household_power_consumption" some days period
# Just be sure that the file is in your current directory.
#

library(lubridate)
Plot2 <- function() {
  #dmy identify Day Month and Year, then as.Date convert to a date format
  #Columns 1:3 are selected (Date, Time and G.Active Power)
  hpc <- read.csv("~/household_power_consumption.txt", sep=";");
  relevant <- hpc[as.Date(dmy(hpc$Date)) == as.Date("2007-02-01") | as.Date(dmy(hpc$Date)) == as.Date("2007-02-02"),c(1:3)]
  relevant$Date <- dmy(relevant$Date)
  relevant_dt <- paste(relevant$Date,relevant$Time)
  plot(ymd_hms(relevant_dt), as.numeric(as.character(relevant$Global_active_power)),pch="l",ylab="Global Active Power (Kilowats)")
}