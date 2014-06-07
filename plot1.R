#
#---This function plot a Histogram chart of Global Active Power from
# "household_power_consumption" dataset
# Just be sure that the file is in your current directory.
#
Plot1 <- function() {
  hpc <- read.csv("~/household_power_consumption.txt", sep=";");
  hpcGap <- as.numeric(as.character(hpc[,3]));
  hist(hpcGap,col="red",xlab="Global Active Power (Kilowats)", main="Global Active Power");
}