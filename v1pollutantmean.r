

pollutantmean <- function(directory="~/specdata/",  pollutant="sulfate",  id = 1:332  )
  {
   
  files<-list.files(path=directory)
  x<-files[id]
  c<-0
  tables<-data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)
  for(i in id)
    {
    c <- c+1 
    
    temp<-read.csv(capture.output(cat(directory,x[c],sep='')))
    print(paste('+',x[c],'--usable rows',nrow(na.omit(temp)),"/",nrow(temp)))
    tables<-rbind(tables,temp)
    }
  print(paste('Total usable rows',nrow(na.omit(tables)),"/",nrow(tables)))
  print(paste('Pollutant mean',mean(na.omit(tables[,pollutant]))))
  }



