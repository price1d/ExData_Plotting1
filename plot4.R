#NOTE: Code expects source file to be in R working directory
#Load dataset & filter to relevant data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
power$DateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
rm(household_power_consumption)

# build graph 4
par(mfrow=c(2,2), cex=0.9,mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active power", xlab="")

plot(power$DateTime, as.numeric(power$Voltage), type="l", ylab="Voltage", xlab="datetime")

plot(power$DateTime, power$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", bty = "n", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5)

plot(power$DateTime, as.numeric(power$Global_reactive_power), type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, "plot4.png", height=480, width=480, bg="white")
dev.off()
