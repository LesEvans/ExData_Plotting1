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

 ## convert global active power from factor to numeric 
 Sel.Time$Global_active_power<-as.character(Sel.Time$Global_active_power)
 Sel.Time$Global_active_power<-as.numeric(Sel.Time$Global_active_power)

##save plot to working directory
png(filename="plot2.png",width=480,height=480,units="px")
##set up margins so all information is included
par(mar=c(9,5,5,3))
with(Sel.Time,plot(Date,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()











Sel.Time <- subset(log, Date>="0007-02-01" & Date<="0007-02-02")

##Change the Date and Time column to date and time variables
Sel.Time$Global_active_power<-as.character(Sel.Time$Global_active_power)
Sel.Time$Global_active_power<-as.numeric(Sel.Time$Global_active_power)
log$Date<-as.character(log$Date)
log$Time<-as.character(log$Time)
library(chron)
log$Date<-chron(dates.=log$Date,format=c(dates="d/m/y"))
log$Time<-chron(times.=log$Time,format=c("h:m:s"))
## Select out the two days required Feb. 1 to Feb 2 2007
Sel.Time <- subset(log, Date>="01/02/2007" & Date<="02/02/2007")
##Change Global Active Power to a numeric
Sel.Time$Global_active_power<-as.character(Sel.Time$Global_active_power)
Sel.Time$Global_active_power<-as.numeric(Sel.Time$Global_active_power)
##Save the subsetted file to working directory for remaining plots
write.table(Sel.Time,"subset_household_power.txt")
##save plot to working directory
png(filename="plot1.png",width=480,height=480,units="px")
##set up margins so all information is included
par(mar=c(9,5,4.2,2.1))
hist(Sel.Time$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts")
dev.off()

ds$Date <- strptime(paste(ds$Date,ds$Time), "%d/%m/%Y %H:%M:%S")
