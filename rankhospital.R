rankhospital <- function(state='AL', outcome='heart attack', num = 'best') {
  ## Read outcome data
  if(outcome=='heart attack'){outcome<-11}
  else if(outcome=='heart failure'){outcome<-17}
  else if(outcome=='pneumonia'){outcome<-23}
  else{stop('invalid outcome')}
  
  if(!is.element(state, state.abb)){stop("invalid state")}
  
  mcodes<-c(11,17,23)
  
  #loadscsv data and makes measurable fields numeric
  dfoutcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  for (i in 1:3)dfoutcome[,mcodes[i]]<-as.numeric(dfoutcome[,mcodes[i]])
  
  #removes na's from outcome field only
  naoutcome<-data.frame(subset(dfoutcome, dfoutcome$State==state & !is.na(dfoutcome[,outcome]), select = c(State,Hospital.Name,outcome), drop = FALSE))
  
  naoutcome<-naoutcome[order(naoutcome[,3] , naoutcome[,2]),]
  
  if(!( is.numeric(num) | num=='best' | num=='worst' )){stop('invalid number')}
  
  
  if(num=='best'){print(naoutcome[1,2])}
  else if(num=='worst'){print(naoutcome[nrow(naoutcome),2])}
  else{print(naoutcome[num,2])}

}

