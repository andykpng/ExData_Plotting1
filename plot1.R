plot1 <- function(){
  #Read Data from txt file
  my_data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)
  #subsetting data between 1/2/2007 to 2/2/2007
  subsetdata <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")
  #change graphical device
  png(filename = "plot1.png", width = 480, height = 480, unit = "px")
  #plot histogram
  hist(as.numeric(subsetdata$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowaltts)", ylab = "Frequency")
  #close device to save the file
  dev.off()
}