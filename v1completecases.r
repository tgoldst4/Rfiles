
complete<-function(directory="~/specdata/",id = 1:332  )
  
{
  part2= data.frame(id=NA,usable=NA)
  files<-list.files(path=directory)
  x<-files[id]
  c<-0
  
  tables<-data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)
  for(i in id)
  {
    c <- c+1 
    
    temp<-read.csv(capture.output(cat(directory,x[c],sep='')))
    temp2<-c(x[c],nrow(na.omit(temp)))
    part2<-rbind(part2,temp2)
    
  }
  print(part2)
}

