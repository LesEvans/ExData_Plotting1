##Read Data into file
log<-read.table("household_power_consumption.txt",sep=";",header=T)

#change from character to date format
log$Date<-as.Date(log$Date,format="%d/%m/%Y")
 
 ##select the dates from Feb 1 to Feb 2 2007
 
Sel.Time<-subset(log,Date>="2007-02-01" & Date<="2007-02-02")
 
 ##Change date and time to a single variable 
Sel.Time$Date<-as.character(Sel.Time$Date)
Sel.Time$Time<-as.character(Sel.Time$Time)
 
Sel.Time$Date<-paste(Sel.Time$Date,Sel.Time$Time,sep=" ")

##convert format from character to date and time format
Sel.Time$Date <- strptime(Sel.Time$Date, "%Y-%m-%d %H:%M:%S")

 ## convert sub metering from factor to numeric 
 Sel.Time$Sub_metering_1<-as.character(Sel.Time$Sub_metering_1)
 Sel.Time$Sub_metering_1<-as.numeric(Sel.Time$Sub_metering_1)

 Sel.Time$Sub_metering_2<-as.character(Sel.Time$Sub_metering_2)
 Sel.Time$Sub_metering_2<-as.numeric(Sel.Time$Sub_metering_2)
 
 Sel.Time$Sub_metering_3<-as.character(Sel.Time$Sub_metering_3)
 Sel.Time$Sub_metering_3<-as.numeric(Sel.Time$Sub_metering_3)

##save plot to working directory
png(filename="plot3.png",width=480,height=480,units="px")
##set up margins so all information is included
par(mar=c(9,5,5,3))
with(Sel.Time,plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(Sel.Time,lines(Date,Sub_metering_2,col="red"))
with(Sel.Time,lines(Date,Sub_metering_3,col="blue"))
legend('topright', names(Sel.Time[7:9]) , 
   lty=1, col=c('black', 'red', 'blue'))
dev.off()