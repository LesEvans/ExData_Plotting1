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

 ## convert required variables from factor to numeric
 ## Global Active Power 
 Sel.Time$Global_active_power<-as.character(Sel.Time$Global_active_power)
 Sel.Time$Global_active_power<-as.numeric(Sel.Time$Global_active_power)

## Sub metering
 Sel.Time$Sub_metering_1<-as.character(Sel.Time$Sub_metering_1)
 Sel.Time$Sub_metering_1<-as.numeric(Sel.Time$Sub_metering_1)

 Sel.Time$Sub_metering_2<-as.character(Sel.Time$Sub_metering_2)
 Sel.Time$Sub_metering_2<-as.numeric(Sel.Time$Sub_metering_2)
 
 Sel.Time$Sub_metering_3<-as.character(Sel.Time$Sub_metering_3)
 Sel.Time$Sub_metering_3<-as.numeric(Sel.Time$Sub_metering_3)

##Voltage
 Sel.Time$Voltage<-as.character(Sel.Time$Voltage)
 Sel.Time$Voltage<-as.numeric(Sel.Time$Voltage)
 
 ##Global Reactive Power
 Sel.Time$Global_reactive_power<-as.character(Sel.Time$Global_reactive_power)
 Sel.Time$Global_reactive_power<-as.numeric(Sel.Time$Global_reactive_power)


##save plots to working directory
png(filename="plot4.png",width=480,height=480,units="px")
##set up print area to have 4 section and margins so all information is included
par(mfcol=c(2,2))
par(mar=c(9.5,5,2,1))
## Plot Global Active Power
with(Sel.Time,plot(Date,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
##Plot Sub Metering
with(Sel.Time,plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(Sel.Time,lines(Date,Sub_metering_2,col="red"))
with(Sel.Time,lines(Date,Sub_metering_3,col="blue"))
legend('topright', names(Sel.Time[7:9]) , 
   lty=1, col=c('black', 'red', 'blue'),bty="n")
##Plot Voltage 
with(Sel.Time,plot(Date,Voltage,type="l",ylab="Voltage",xlab="Dateline"))
 ##Plot Global Reactive Power 
with(Sel.Time,plot(Date,Global_reactive_power,type="l",xlab="Dateline"))
dev.off()