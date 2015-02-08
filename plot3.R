plot3<-function(){
  elec<-fread("household_power_consumption.txt",data.table = F)
  elec2<-elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]
  elec2$Global_active_power<-as.numeric(elec2$Global_active_power)
  elecDates<-strptime(paste(elec2$Date,elec2$Time),format="%d/%m/%Y %H:%M:%S")
  plot(elecDates,elec2$Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(elecDates,elec2$Sub_metering_2,col='Red')
  lines(elecDates,elec2$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}