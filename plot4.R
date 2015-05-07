##Combining all the graphs in One.
filename <- 'household_power_consumption.txt'
orgData <- read.table(filename, header=TRUE, sep=';', na.strings='?')
orgData$Time <- strptime(paste(orgData$Date,orgData$Time),"%d/%m/%Y %H:%M:%S")
orgData$Date <- as.Date(orgData$Date, format = '%d/%m/%Y')
orgData <- subset(orgData, orgData$Date >= '2007-02-01' & orgData$Date <= '2007-02-02')

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(orgData, {
  plot(orgData$Time,orgData$Global_active_power,xlab='',ylab='Global Active Power',type='l')
  plot(orgData$Time,orgData$Voltage, xlab='datetime',ylab='Volatage', type='l')
  plot(orgData$Time, orgData$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",col='black')
  lines(orgData$Time,orgData$Sub_metering_2, col = 'red')
  lines(orgData$Time,orgData$Sub_metering_3, col = 'blue')
  legend("topright",lty=1, col=c('black','red','blue'),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  plot(orgData$Time, orgData$Global_reactive_power, type="n",
       xlab="datetime", ylab="Global_reactive_power")
  lines(orgData$Time, orgData$Global_reactive_power)
})
dev.off()