data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Converting dates
datetime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
dataSubset$datetime <- as.POSIXct(datetime)

# Plot 2
with(dataSubset, {plot(Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")})
#create png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
