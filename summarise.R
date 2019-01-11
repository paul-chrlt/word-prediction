## config import

source(config.R)

letterfiles <- paste0(letteraggregatedfolder, list.files(letteraggregatedfolder))

## libraries

library(data.table)
library(dplyr)
library(magrittr)

## functions definition

summarisation <- function(file,exportfilename){
    load(file)
    print(paste(exportfilename,"- file loaded"))
    totalfrequences <- totalfrequences %>%
        group_by(words) %>%
        summarise_all(funs(mean(count,na.rm=TRUE)))
    print(paste(exportfilename,"- file summarised"))
    totalpathname <- paste0(summarisedfolder,exportfilename)
    save(totalfrequences,file=totalpathname)
    print(paste(exportfilename,"- file saved"))
}

lettercaller <- function(){
    for (i in 1:length(letters)){
        print(paste("calling summarisation for letter",letters[i]))
        summarisation(letterfiles[i],letters[i])
        print(paste("letter",letters[i],"summarised"))
    }
}

## function call

lettercaller()
