#### plot3.R ####
Sys.setlocale(category = "LC_ALL", "en_US.UTF-8")

if(!file.exists("PowerData.zip")) {
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,"PowerData.zip")
  unzip("PowerData.zip")
}

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data <- data[as.character(data$Date) %in% c('2/2/2007','1/2/2007'),]
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")


## Plot Submetering_1
plot(x=data$DateTime,
     y=data$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering"
)

## Plot sub_metering_2
lines(x=data$DateTime,
      y=data$Sub_metering_2,
      type="l",
      col="red")

## Plot sub_metering_3
lines(x=data$DateTime,
      y=data$Sub_metering_3,
      type="l",
      col="blue")

legend("topright",
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd=1,
       col=c("black", "red", "blue"))

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()
