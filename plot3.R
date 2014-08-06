plot3 <-
function()
    {
        #The file is downloaded manually.
        filename0 <- "household_power_consumption.txt"
        ds0 <- read.table(filename0,header=T,sep=";")
        ds1 <- subset(ds0,ds0$Date=="1/2/2007" || ds0$Date=="2/2/2007")
        #All desired data store in data frame "ds1".
        
        library(datasets)
        ylab3 <- "Energy sub metering"
        legend3 <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        color3 <- c("black","red","blue")
        #define labels and strings first
        
        Sys.setlocale("LC_TIME", "English")
        #Set locale to make sure the plot displayed in English.
        ds1_dt <- as.POSIXct(paste(ds1$Date, ds1$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
        
        png(file="plot3.png")
        plot(x=ds1_dt, y=ds1$Sub_metering_1, xlab="", ylab=ylab3, type="l",lty=1, col="black")
        lines(x=ds1_dt, y=ds1$Sub_metering_2, xlab="", type="l",lty=1, col="red")
        lines(x=ds1_dt, y=ds1$Sub_metering_3, xlab="", type="l",lty=1, col="blue")
        legend("topright",legend = legend3, col = color3, lty=1)
        dev.off()
        #plot and save
    }
