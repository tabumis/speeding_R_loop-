system.time(
  for(i in 6:nrow(station)){
        if (station$Tav[i]< -1 & station$dprcp[i]>0){
        station$dSWE[i]<-station$dprcp[i]
      } else if(station$Tav[i]< -1  & station$dprcp[i]==0 ){
        station$dSWE[i]<-0
      }  else {
        
      station$dSWE[i]<-predict(svm_model,station[i,])}
      
      station$simSWE[i]<-ifelse(station$simSWE[i-1]<=-station$dSWE[i],0,station$simSWE[i-1]+station$dSWE[i])
      station$dSWElag[i+1]<-station$dSWE[i]
      
    }
)
