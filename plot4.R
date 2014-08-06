plot4 <-
function()
    {
        #The file is downloaded manually.
        filename0 <- "household_power_consumption.txt"
        ds0 <- read.table(filename0,header=T,sep=";")
        ds1 <- subset(ds0,ds0$Date=="1/2/2007" || ds0$Date=="2/2/2007")
        #All desired data store in data frame "ds1".
        
        library(datasets)
        Sys.setlocale("LC_TIME", "English")
        #Set locale to make sure the plot displayed in English.
        ds1_dt <- as.POSIXct(paste(ds1$Date, ds1$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
        
        xlab4 <- "datetime"
        ylab4_1 <- "Global Active Power"
        ylab4_2 <- "Energy sub metering"
        ylab4_3 <- "Voltage"
        ylab4_4 <- "Global_reactive_power"
        color4 <- c("black","red","blue")
        legend4 <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        #define labels and strings first
        
        png(file="plot4.png")
        par(mfrow=c(2,2), mar=c(4,4,2,1))
        
        plot(x=ds1_dt, y=ds1$Global_active_power, xlab="", ylab=ylab4_1, type="l",lty=1)
        
        plot(x=ds1_dt, y=ds1$Voltage, xlab=xlab4, ylab=ylab4_2, type="l",lty=1, col="black")
        
        plot(x=ds1_dt, y=ds1$Sub_metering_1, xlab="", ylab=ylab4_2, type="l",lty=1, col="black")
        lines(x=ds1_dt, y=ds1$Sub_metering_2, xlab="", type="l",lty=1, col="red")
        lines(x=ds1_dt, y=ds1$Sub_metering_3, xlab="", type="l",lty=1, col="blue")
        legend("topright",legend = legend4, col = color4, lty=1, bty="n", cex=0.5)
        
        plot(x=ds1_dt, y=ds1$Global_reactive_power, xlab=xlab4, ylab=ylab4_3, type="l",lty=1)
        dev.off()
        #plot and save
    }
