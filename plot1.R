data<-read.table(
    "./data//household_power_consumption/household_power_consumption.txt",
    sep=";", header=TRUE, stringsAsFactors = FALSE)

smallData<-data[as.Date(data$Date,"%d/%m/%Y") == "2007-02-01" | 
                    as.Date(data$Date,"%d/%m/%Y") == "2007-02-02",]

smallData$DateTime=as.POSIXlt(
    paste(smallData$Date,smallData$Time),
    tz="", "%d/%m/%Y %H:%M:%S")

png(file="Project 1/plot1.png")

par(mfrow=c(1,1))
par(mar = c(4,4,2,2))
par(bg=NA)

hist(as.numeric(smallData$Global_active_power),col="red",
     main="Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()

rm(data)
rm(smallData)