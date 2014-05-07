# setwd('C:/Coursera/Exploratory Data Analysis')

mydata <- read.table('household_power_consumption.txt',
                     header=TRUE,
                     sep=';',na.string='?')
mydata$Date2 <- with(mydata,as.Date(Date,'%d/%m/%Y'))
mydata2 <- subset(mydata,Date2%in%as.Date(c('01/02/2007','02/02/2007'),'%d/%m/%Y'))
mydata2$DateTime <- with(mydata2,strptime(paste(Date,Time,sep=' '),'%d/%m/%Y %H:%M:%OS'))




png('Plot4.png',width=480,height=480)
par(mfrow=c(2,2))
#1
with(mydata2,plot(DateTime,Global_active_power,type='l',xlab='',
                  ylab='Global Active Power(kilowatts)'))
#2
with(mydata2,plot(DateTime,Voltage,type='l', 
                  ylab='Voltage',xlab='datetime'))
#3
with(mydata2,plot(DateTime,Sub_metering_1,type='l',xlab='',
                  ylab='Energy sub metering'))
with(mydata2,lines(DateTime,Sub_metering_2,type='l',col='red'))
with(mydata2,lines(DateTime,Sub_metering_3,type='l',col='blue'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1,col=c('black','red','blue'),bty='n')
#4
with(mydata2,plot(DateTime,Global_reactive_power,type='l', 
                  ylab='Global_reactive_power',xlab='datetime'))
dev.off()
