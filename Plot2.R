# setwd('C:/Coursera/Exploratory Data Analysis')


mydata <- read.table('household_power_consumption.txt',
                     header=TRUE,
                     sep=';',na.string='?')
mydata$Date2 <- with(mydata,as.Date(Date,'%d/%m/%Y'))
mydata2 <- subset(mydata,Date2%in%as.Date(c('01/02/2007','02/02/2007'),'%d/%m/%Y'))
mydata2$DateTime <- with(mydata2,strptime(paste(Date,Time,sep=' '),'%d/%m/%Y %H:%M:%OS'))


png('plot2.png',width=480,height=480)
with(mydata2,plot(DateTime,Global_active_power,type='l',xlab='',
                  ylab='Global Active Power(kilowatts)'))
dev.off()

