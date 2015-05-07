fileName <- 'household_power_consumption.txt'
orgData <- read.table(fileName, header=TRUE,sep=';', na.strings = '?')
## first converting the time and later date using strpTime and as.Date
orgData$Time <- strptime(paste(orgData$Date, orgData$Time), "%d/%m/%Y %H:%M:%S")
orgData$Date <- as.Date(orgData$Date, format = '%d/%m/%Y')
##Subset the data for the two dates specified in the assingment
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
orgData <- subset(orgData, Date %in% dates)
##
##Plot1.R code
hist(orgData$Global_active_power, main="Global Active Power",
   xlab="Global Active Power (kilowatts)",
   ylab="Frequency",
   col='red')
dev.copy(png, 'plot1.png', height=480, width = 480)
dev.off()