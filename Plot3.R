#Plot 3
#distribution of sub_metering over 2 days

if(!file.exists("household_power_consumption.txt")) {
  print("input file not found")
  return
}
library(lubridate)
#Reading only rows relevant to the the exercise
pdata <- read.table("household_power_consumption.txt",
                    col.names = c("Date","Time","Global_active_power", 
                                  "Global_reactive_power", "Voltage", 
                                  "Global_intensity", 
                                  "Sub_metering_1", "Sub_metering_2", 
                                  "Sub_metering_3"), sep=";", 
                    stringsAsFactors=FALSE, 
                    na.strings=c("?", "NA"), 
                    skip=66637, nrows=2880)
#convert date and time strings to their native formats
pdata$Time <- strptime(paste(pdata$Date, pdata$Time), format= "%d/%m/%Y %H:%M:%S")
pdata$Date <- as.Date(pdata$Date, format = guess_formats(pdata$Date,c('dmy')))

#plot
par(oma=c(1,1,1,1))
plot(pdata$Time, pdata$Sub_metering_1, type="s", xlab="", ylab="Energy sub metering")
lines(pdata$Time, pdata$Sub_metering_2, col="red")
lines(pdata$Time, pdata$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1),
       lwd=c(2,2),
       adj=0.08,
       col=c("black", "red","blue"))

#write to png format
dev.copy(device = png, filename = 'Plot3.png', width = 480, height = 480) 
dev.off()