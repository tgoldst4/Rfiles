
complete<-function(directory="~/specdata/",id = 1:332  )
  
{
  library("stringr")  
  part2= data.frame(id=NA,nobs=NA)
  files<-list.files(path=directory)
  x<-files[id]
  c<-0
  
  tables<-data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)
  for(i in id)
  {
    c <- c+1 
    
    temp<-read.csv(capture.output(cat(directory,x[c],sep='')))
    temp2<-c(as.numeric(str_sub(x[c],1,3)),nrow(na.omit(temp)))
    part2<-rbind(part2,temp2)
    
  }
  print(na.omit(part2))
}

