## config import
library(here)
source(paste0(here(),"/config.R"))
letterfiles <- paste0(summarisedfolder, list.files(summarisedfolder))

## libraries

library(data.table)

## function definition

clearer <- function(file,exportname){
    load(file)
    print(paste(exportname,"- file loaded"))
    deleted <- 1-keeped
    mincount <- quantile(totalfrequences$count,1-keeped)
    frequences <- totalfrequences[totalfrequences$count>mincount,]
    print(paste(exportname,"-",deleted*100,"% data cleared"))
    save(frequences,file = paste0(lightfolder,exportname))
    print(paste(exportname,"- file saved"))
}

lettercaller <- function(){
    for (i in 1:length(letters)){
        print(paste("calling database clearing for letter",letters[i]))
        clearer(letterfiles[i],letters[i])
        print(paste("letter",letters[i],"cleared"))
    }
}

## function call

lettercaller()