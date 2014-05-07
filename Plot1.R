# setwd('C:/Coursera/Exploratory Data Analysis')


mydata <- read.table('household_power_consumption.txt',
                     header=TRUE,
                     sep=';',na.string='?')
mydata$Date2 <- with(mydata,as.Date(Date,'%d/%m/%Y'))
mydata2 <- subset(mydata,Date2%in%as.Date(c('01/02/2007','02/02/2007'),'%d/%m/%Y'))

png('plot1.png',width=480,height=480)
with(mydata2,hist(Global_active_power,col='orange',
                  xlab='Global Active Power(kilowatts)',
                  main='Global Active Power',
                  axes=FALSE))
axis(1,at=c(0,2,4,6),label=c(0,2,4,6))
axis(2,at=seq(0,1200,by=200),label=seq(0,1200,by=200))
dev.off()
