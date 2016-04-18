# Getting full dataset
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Converting dates
datetime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
dataSubset$datetime <- as.POSIXct(datetime)

#plot 3
with(dataSubset, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#creating png 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
