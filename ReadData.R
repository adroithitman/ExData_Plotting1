#read Data for Household Power Consumption
library(stringr)

#Path of downloaded and unzipped Data file
path<-"hpc/household_power_consumption.txt"

#Only Data which is relevant will be read

#Data will be read in between below dates only.
DATE1<-as.Date("2007-02-01","%Y-%m-%d")
DATE2<-as.Date("2007-02-02","%Y-%m-%d")

#Open connection
con <- file(path, open = "r")
dat<-data.frame()

#read and save headers
line <- readLines(con, 1)
colname<-do.call(rbind, strsplit(line, split=";"))

#Loop through all rows to read only required lines
i<-2
lineLength <- length(readLines(path))
for (i in 2:lineLength-1){
line <- readLines(con, 1)
if(is.null(line)){
   break
}
splitTmp<-strsplit(line, split=";")
tmp<-do.call(rbind, splitTmp)

#Date Date is pulled to compare it against required boundary
dateVal<-as.Date(tmp[1,1],"%d/%m/%Y")
if(dateVal>=DATE1 & dateVal<=DATE2){
   #data is meeting required criteria
   #All the row will be read and added to an existing Data frame
    tmpDat <- as.data.frame(do.call(rbind, splitTmp), stringsAsFactors=FALSE)
    dat<-rbind(dat,tmpDat)
    }


i <- i + 1
}
#set column names to data
names(dat)<-colname

#Format column for Data analysis
dat$Date <-as.Date(dat$Date,"%d/%m/%Y")
dat$Day<-weekdays(dat$Date)
dat$DateTime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")

#closed connection
close(con)
