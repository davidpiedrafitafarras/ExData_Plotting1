data<-read.table(
    "./data//household_power_consumption/household_power_consumption.txt",
    sep=";", header=TRUE, stringsAsFactors = FALSE)

smallData<-data[as.Date(data$Date,"%d/%m/%Y") == "2007-02-01" | 
                    as.Date(data$Date,"%d/%m/%Y") == "2007-02-02",]

smallData$DateTime=as.POSIXlt(
    paste(smallData$Date,smallData$Time),
    tz="", "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English")

png(file="Project 1/plot2.png")

par(mfrow=c(1,1))
par(mar = c(4,4,2,2))
par(bg=NA)

plot(smallData$DateTime,smallData$Global_active_power,
     type="l",xlab="",ylab="")
title(ylab="Global Active Power (kilowatts)")

dev.off()

Sys.setlocale("LC_TIME","Spanish_Spain.1252")

rm(data)
rm(smallData)