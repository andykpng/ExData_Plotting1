plot4 <- function(){
  #Read data from file
  my_data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)
  #subsetting data between 1/2/2007 to 2/2/2007
  subsetdata <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")
  #change graphical device
  png(filename = "plot4.png", width = 480, height = 480, unit = "px")
  #parse date time object to prepare for plot
  datetime <- as.POSIXlt(paste(as.character(subsetdata[,1]), as.character(subsetdata[,2])), format = "%d/%m/%Y %H:%M:%S")
  #setup graphic device
  par(mfrow = c(2,2))
  #plot first graph
  plot(datetime, subsetdata$Global_active_power, type= "l", ylab = "Global Active Power", xlab = "")
  #plot second graph
  plot(datetime, subsetdata$Voltage, type= "l", ylab = "Voltage", xlab = "datetime")
  #plot third graph
  plot(datetime, subsetdata$Sub_metering_1, type= "n", ylab = "Energy sub metering", xlab = "")
  points(datetime, subsetdata$Sub_metering_1, type = "l", col = "black")
  points(datetime, subsetdata$Sub_metering_2, type = "l", col = "red")
  points(datetime, subsetdata$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
  #plot fourth graph
  plot(datetime, subsetdata$Global_reactive_power, type= "l", ylab = "Global reactive power", xlab = "datetime")
  #close device to save the file
  dev.off()
}