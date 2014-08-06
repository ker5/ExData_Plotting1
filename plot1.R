plot1 <-
function()
    {
        #The file is downloaded manually.
        filename0 <- "household_power_consumption.txt"
        ds0 <- read.table(filename0,header=T,sep=";")
        ds1 <- subset(ds0,ds0$Date=="1/2/2007" || ds0$Date=="2/2/2007")
        #All desired data store in data frame "ds1".
        
        library(datasets)
        main1 <- "Global Active Power"
        xlab1 <- "Global Active Power(kilowatts)"
        #define labels first
        
        png(file="plot1.png")
        hist(ds1$Global_active_power,main=main1,col="red",xlab=xlab1)
        dev.off()
        #plot and save
    }
