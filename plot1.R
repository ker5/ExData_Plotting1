plot1 <-
function()
{
    #The file is downloaded manually
    filename0 <- "household_power_consumption.txt"
    #Read the first and second line(header & 1st obs)
    data0 <- read.table(filename0,header=T,sep=";",nrow=1)
    
    i <- 2
    flag1 <- FALSE
    
    #use repeat loop to read each line in the file
    repeat
    {
        #To avoid infinite loop
        if(i>2075259)
        {
            break
        }
        
        #Read a line, controlled by "skip=i"
        data1 <- read.table(filename0,header=F,sep=";",skip=i,nrow=1)
        #assign colnames to the new reading line, bcz rbind later
        colnames(data1) <- colnames(data0)
        i <- i+1
        
        #"flag1=F" = I've NOT read the row I want to process
        if(flag1==FALSE)
        {
            if(data1[1]=="1/2/2007")
            {
                #Just find the first desired row
                flag1 <- TRUE
                data2 <- rbind(data0,data1)
                #Delete the first line of entire file by subsetting
                #it's read before repeat loop
                data0 <- subset(data2[data2$Date=="1/2/2007",])
                next
            }	
        }
        else
        {
            #After the desired rows started
            if(data1$Date=="1/2/2007" || data1$Date=="2/2/2007")
            {
                #Desired rows except the first one
                flag1 <- TRUE
                data0 <- rbind(data0,data1)
                next
            }
            else
            {
                #After all desired rows read, it's ok to end it up
                flag1 <- FALSE
                break
            }
        }	
    }
    #All desired data store in data frame "data0".
    
    ds0 <- data0
    #ds0 is 2880 obs. of 9 variables
    
    library(datasets)
    main1 <- "Global Active Power"
    xlab1 <- "Global Active Power(kilowatts)"
    png(file="plot1.png")
    hist(ds0$Global_active_power,main=main1,col="red",xlab=xlab1)
    dev.off()
}