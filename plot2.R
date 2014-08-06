plot2 <-
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
        
        png(file="plot2.png")
        plot(x=ds1_dt, y=ds1$Global_active_power, xlab="", ylab=xlab1, type="l",lty=1)
        dev.off()
        #plot and save
    }
