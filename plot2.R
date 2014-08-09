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