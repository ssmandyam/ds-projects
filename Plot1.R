#Plot 1
# Histogram of Global Active Power

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
hist(pdata$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#write to png format
dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480) 
dev.off()

