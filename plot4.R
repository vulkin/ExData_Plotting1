raw<-read.table("C:/Users/Nikhil/Downloads/Data Science Specialization/4. Exploratory Data/week 1/household_power_consumption.txt",header=TRUE,sep=";")


library(dplyr)

raw<-tbl_df(raw)

dat<-filter(raw,Date=="1/2/2007"|Date=="2/2/2007")

d<-as.POSIXlt(as.Date((dat$Date),format="%d/%m/%Y"))
t<-strptime(dat$Time,format="%H:%M:%S",tz="UTC")
t$mday<-d$mday
t$wday<-d$wday
t$mon<-d$mon
t$year<-d$year

dat$Date<-d
dat$Time<-t

dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
dat$Voltage<-as.numeric(as.character(dat$Voltage))
dat$Global_reactive_power<-as.numeric(as.character(dat$Global_reactive_power))

#plot4

par(mfrow=c(2,2),mar=c(4,4,1,1))

plot(dat$Time,dat$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(dat$Time,dat$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(dat$Time,dat$Sub_metering_1,type="l",col="grey",xlab="",ylab="Energy Sub Metering")
points(dat$Time,dat$Sub_metering_2,col="red",type="l")
points(dat$Time,dat$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.6)

plot(dat$Time,dat$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="datetime")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()






