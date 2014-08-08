

setwd("~/Desktop/Data Specialisation/ExploreData") 
log<-read.table("household_power_consumption.txt",sep=";",header=T)
##Change the Date and Time column to date and time variables
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


