### plot1.R ###
Sys.setlocale(category = "LC_ALL", "en_US.UTF-8")

if(!file.exists("PowerData.zip")) {
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,"PowerData.zip")
  unzip("PowerData.zip")
}

data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(data$Date, data$Time)
data <- cbind(data, as.POSIXct(dateTime))
names(data)[ncol(data)] <- "datetime"

hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global active power (kilowatts)")
dev.copy(png, filename="plot1.png")
dev.off ()
