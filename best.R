best <- function(state='AL', outcome='heart attack') {
  ## Read outcome data
  if(outcome=='heart attack'){outcome<-11}
  else if(outcome=='heart failure'){outcome<-17}
  else if(outcome=='pneumonia'){outcome<-23}
  else{stop('invalid outcome')}
  
  if(!is.element(state, state.abb)){stop("invalid state")}
    
    
  mcodes<-c(11,17,23)
  
  dfoutcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  for (i in 1:3)dfoutcome[,mcodes[i]]<-as.numeric(dfoutcome[,mcodes[i]])
  #removes na's from outcome field only
  naoutcome<-data.frame(subset(dfoutcome, dfoutcome$State==state & !is.na(dfoutcome[,outcome]), select = c(State,Hospital.Name,outcome), drop = FALSE))
  print(naoutcome[which.min(apply(naoutcome,MARGIN=1,min)),][,2])
  
}


