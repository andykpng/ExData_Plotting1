plot2 <- function(){
  #Read data from file
  my_data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)
  #subsetting data between 1/2/2007 to 2/2/2007
  subsetdata <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")
  #change graphical device
  png(filename = "plot2.png", width = 480, height = 480, unit = "px")
  #parse date time object to prepare for plot
  datetime <- as.POSIXlt(paste(as.character(subsetdata[,1]), as.character(subsetdata[,2])), format = "%d/%m/%Y %H:%M:%S")
  #plot everything to graphic device
  plot(datetime, subsetdata$Global_active_power, type= "l", ylab = "Global Active Power(kilowalts)", xlab = "")
  dev.off()
}