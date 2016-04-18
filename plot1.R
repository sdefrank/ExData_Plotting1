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



#plot 1
hist(dataSubset$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#creating png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
