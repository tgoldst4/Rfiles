

corr <- function(directory="~/specdata/",  threshold=0,  id = 1:332  )
{
  
  files<-list.files(path=directory)
  x<-files[id]
  c<-0
  usable<-0
  uid<-NA
  tables<-data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)
  for(i in id)
  {
    c <- c+1 
    
    temp<-read.csv(capture.output(cat(directory,x[c],sep='')))
    print(paste('+',x[c],'--usable rows',nrow(na.omit(temp)),"/",nrow(temp)))
    if(nrow(na.omit(temp))> threshold)
    {
      tables<-rbind(tables,temp)
      usable<-usable+1
      uid<-c(uid,temp[1,"ID"])
    }
  }
  print(paste('# Stations exceeding threshold',usable,':'))
  print(capture.output(cat(na.omit(uid))))
  
  print(paste('Total usable rows',nrow(na.omit(tables)),"/",nrow(tables)))
  if(usable>0)
  {cor(tables[,2:3], use="complete.obs")}
}

