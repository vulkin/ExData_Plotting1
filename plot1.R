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

#plot 1
hist(dat$Global_active_power,col="red",xlab="Global Active Power(killowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
