rankall <- function(outcome='heart attack', num = "best") {
  ## Read outcome data
  if(outcome=='heart attack'){outcome<-11}
  else if(outcome=='heart failure'){outcome<-17}
  else if(outcome=='pneumonia'){outcome<-23}
  else{stop('invalid outcome')}
  
  if(!( is.numeric(num) | num=='best' | num=='worst' )){stop('invalid number')}
  
  mcodes<-c(11,17,23)
  
  results<-matrix(nrow=50,ncol=2)
  colnames(results)<-c('state','hospital')
  
  #loadscsv data and makes measurable fields numeric
  dfoutcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  for (i in 1:3){dfoutcome[,mcodes[i]]<-as.numeric(dfoutcome[,mcodes[i]])}
  
  for (i in 1:50)  {
    
    state<- state.abb[i]
    
    #removes na's from outcome field only
    naoutcome<-data.frame(subset(dfoutcome, dfoutcome$State==state & !is.na(dfoutcome[,outcome]), select = c(State,Hospital.Name,outcome), drop = FALSE))
    naoutcome<-naoutcome[order(naoutcome[,3] , naoutcome[,2]),]
    
    if(num=='best'){ results[i,] <-cbind( naoutcome[1,1], naoutcome[1,2] ) }
    else if(num=='worst'){results[i,]<-cbind(naoutcome[nrow(naoutcome),1], naoutcome[nrow(naoutcome),2])}
    else{results[i,]<-cbind(naoutcome[num,1],naoutcome[num,2])}
    
    }
  results<-(    (results)[order(cbind(results,state.abb)[,3]) ,]   )
  
  results[,1]<-state.abb[order(state.abb)]
  
  print(as.data.frame(results<-results[,c('hospital','state')]))
}

