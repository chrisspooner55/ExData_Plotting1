dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
#Filter the data to be only the 1st and 2nd Feb 2007
dt <- dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
#Add the Date and time together to form a POSIXct data column
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
#Plot to file
png(file = "plot1.png") ## Open PNG device; create 'plot1.png' in my working directory
hist(dt$Global_active_power,col = "Red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


