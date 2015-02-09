plot1<-function(){
elec<-fread("household_power_consumption.txt",data.table = F)
elec2<-elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]
elec2$Global_active_power<-as.numeric(elec2$Global_active_power)
par(cex = 0.75)
png("plot1.png",width = 480,height = 480)
hist(elec2$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.off()
dev.off()
}