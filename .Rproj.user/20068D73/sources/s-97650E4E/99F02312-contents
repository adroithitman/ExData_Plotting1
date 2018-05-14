path<-"hpc/household_power_consumption.txt"

library(stringr)

DATE1<-as.Date("2007-02-01","%Y-%m-%d")
DATE2<-as.Date("2007-02-02","%Y-%m-%d")
con <- file(path, open = "r")
dat<-data.frame()
line <- readLines(con, 1)
colname<-do.call(rbind, strsplit(line, split=";"))
i<-2
lineLength <- length(readLines(path))
for (i in 2:lineLength-1){
line <- readLines(con, 1)
if(is.null(line)){
   break
}
splitTmp<-strsplit(line, split=";")
tmp<-do.call(rbind, splitTmp)
dateVal<-as.Date(tmp[1,1],"%d/%m/%Y")
print(dateVal)
if(dateVal>=DATE1 & dateVal<=DATE2){
    tmpDat <- as.data.frame(do.call(rbind, splitTmp), stringsAsFactors=FALSE)
    dat<-rbind(dat,tmpDat)
    }


i <- i + 1
}
names(dat)<-colname 
close(con)
