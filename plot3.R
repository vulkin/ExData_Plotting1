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

#plot3
plot(dat$Time,dat$Sub_metering_1,type="l",col="grey",xlab="",ylab="Energy Sub Metering")
points(dat$Time,dat$Sub_metering_2,col="red",type="l")
points(dat$Time,dat$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.6)
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

