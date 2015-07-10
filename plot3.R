#NOTE: Code expects source file to be in R working directory
#Load dataset & filter to relevant data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
power$DateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
rm(household_power_consumption)

# build graph 3
par(mfrow=c(1,1), cex=1)
plot(power$DateTime, power$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", pch="-", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, "plot3.png", height=480, width=480, bg="white")
dev.off()
