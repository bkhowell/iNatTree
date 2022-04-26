library(jpeg)
library(rinat)
library(httr)

obs<-get_inat_obs("Mertensia", quality = "research", maxresults = 20)

subDir<-"imgs"
if (file.exists(paste("./",subDir, sep = ""))){
  setwd(paste("./",subDir, sep = ""))
} else {
  dir.create(paste("./",subDir, sep = ""))
  setwd(paste("./",subDir, sep = ""))
  
}


for(i in 1:length(obs$image_url)) {
  GET(as.character(obs$image_url[[i]]), 
      write_disk(paste0(obs$id[[i]], ".png", sep=""), overwrite=TRUE))
}

write.csv(obs, file = "observations.csv")
