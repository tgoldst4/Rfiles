

corr <- function(directory="~/specdata/",  threshold=0,  id = 1:332  )
{
  
  files<-list.files(path=directory)
  x<-files[id]
  c<-0
  out<-NA
  tables<-data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)
  for(i in id)
    {
      c <- c+1 
    
      temp<-read.csv(capture.output(cat(directory,x[c],sep='')))

      if(nrow(na.omit(temp))> threshold)
        {
          out<-c(out,with(temp,cor(sulfate,nitrate, use="complete.obs")))
        }
        else
          {
            out<-out
          }
    }
  print(na.omit(out))

}


