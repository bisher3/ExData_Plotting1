plot4<-function(){
  elec<-fread("household_power_consumption.txt",data.table = F)
  elec2<-elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]
  elec2$Global_active_power<-as.numeric(elec2$Global_active_power)
  elecDates<-strptime(paste(elec2$Date,elec2$Time),format="%d/%m/%Y %H:%M:%S")
  par(mfrow=c(2,2), mar=c(6,5,4,1), oma=c(1,1,1,1),cex=0.6)
  plot(elecDates,elec2$Global_active_power,type="l", ylab="Global Active Power", xlab="")
  plot(elecDates,elec2$Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(elecDates,elec2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(elecDates,elec2$Sub_metering_2,col='Red')
  lines(elecDates,elec2$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(elecDates,elec2$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
  dev.off()
}