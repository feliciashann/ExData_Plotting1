#### plot4.R ####
Sys.setlocale(category = "LC_ALL", "en_US.UTF-8")

if(!file.exists("PowerData.zip")) {
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,"PowerData.zip")
  unzip("PowerData.zip")
}

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data <- data[as.character(data$Date) %in% c('2/2/2007','1/2/2007'),]
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(x = data$DateTime,
     y = data$Global_active_power,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Global Active Power"
)

plot(x = data$DateTime,
     y = data$Voltage, 
     type = "l", 
     col = "black", 
     xlab = "datetime", 
     ylab = "Voltage"
)


plot(x = data$DateTime,
     y = data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "" ,
     ylab = "Energy sub metering"
)


lines(x = data$DateTime,
      y = data$Sub_metering_2,
      type = "l",
      col = "red")

lines(x = data$DateTime,
      y = data$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright" ,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1, 
       bty = "n",
       col = c("black", "red", "blue"))

plot(x = data$DateTime,
     y = data$Global_reactive_power,
     type = "l", 
     col = "black",
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
