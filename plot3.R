data<-read.table(
    "./data//household_power_consumption/household_power_consumption.txt",
    sep=";", header=TRUE, stringsAsFactors = FALSE)

smallData<-data[as.Date(data$Date,"%d/%m/%Y") == "2007-02-01" | 
                    as.Date(data$Date,"%d/%m/%Y") == "2007-02-02",]

smallData$DateTime=as.POSIXlt(
    paste(smallData$Date,smallData$Time),
    tz="", "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English")

png(file="Project 1/plot3.png")

par(mfrow=c(1,1))
par(mar = c(4,4,2,2))
par(bg=NA)

plot(smallData$DateTime,smallData$Sub_metering_1,type="n",xlab="",ylab="")
points(smallData$DateTime,smallData$Sub_metering_1, type="l", col="Black")
points(smallData$DateTime,smallData$Sub_metering_2, type="l", col="Red")
points(smallData$DateTime,smallData$Sub_metering_3, type="l", col="Blue")
title(ylab="Energy sub metering")
legend("topright",lty=c(1,1,1), col=c("Black","Red","Blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

Sys.setlocale("LC_TIME","Spanish_Spain.1252")

rm(data)
rm(smallData)