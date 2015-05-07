###Exporting the png image for the sub metering case
fileName <- 'household_power_consumption.txt'
orgData <- read.table(fileName, header=TRUE,sep=';', na.strings = '?')
## first converting the time and later date using strpTime and as.Date
orgData$Time <- strptime(paste(orgData$Date, orgData$Time), "%d/%m/%Y %H:%M:%S")
orgData$Date <- as.Date(orgData$Date, format = '%d/%m/%Y')
##Subset the data for the two dates specified in the assingment
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
orgData <- subset(orgData, Date %in% dates)
png("plot3.png", width=480, height=480)
plot(orgData$Time, orgData$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",col='black')
lines(orgData$Time,orgData$Sub_metering_2, col = 'red')
lines(orgData$Time,orgData$Sub_metering_3, col = 'blue')
legend("topright",lty=1, col=c('black','red','blue'),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()