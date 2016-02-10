dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
#Filter the data to be only the 1st and 2nd Feb 2007
dt <- dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
#Add the Date and time together to form a POSIXct data column
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
#Plot to file
png("plot3.png")
plot(dt$DateTime,dt$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "")
par(new = TRUE)
plot(dt$DateTime,dt$Sub_metering_2, type = "l", axes = FALSE, ylim=range(c(dt$Sub_metering_1,dt$Sub_metering_2)), col = "red", xlab = "", ylab = "")
par(new = TRUE)
plot(dt$DateTime,dt$Sub_metering_3, type = "l", axes = FALSE, ylim=range(c(dt$Sub_metering_1,dt$Sub_metering_2,dt$Sub_metering_2)), col = "blue", xlab = "", ylab = "Energy Sub Metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col =c("black","red","blue"),plot = TRUE)
dev.off()

