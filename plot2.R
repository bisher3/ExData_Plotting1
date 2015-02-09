plot2<-function(){
  elec<-fread("household_power_consumption.txt",data.table = F)
  elec2<-elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]
  elec2$Global_active_power<-as.numeric(elec2$Global_active_power)
  par(cex=0.75)
  elecDates<-strptime(paste(elec2$Date,elec2$Time),format="%d/%m/%Y %H:%M:%S")
  plot(elecDates,elec2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
  dev.off()
}