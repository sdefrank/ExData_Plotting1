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

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(dataSubset, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy Sub Metering)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global_Reactive_power",xlab="datetime")
})

#creating png 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
