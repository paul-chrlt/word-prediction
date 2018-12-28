# setwd("/home/paul/workspace/coursera/capstone")
letteraggregatedfolder <- "./aggregatedbyletter/"
letterfiles <- paste0(letteraggregatedfolder, list.files(letteraggregatedfolder))
exportfolder <- "./summarisedbyletter/"

library(data.table)
library(dplyr)
library(magrittr)

summarisation <- function(file,exportfilename){
    load(file)
    print(paste(exportfilename,"- file loaded"))
    totalfrequences <- totalfrequences %>%
        group_by(words) %>%
        summarise_all(funs(sum(count,na.rm=TRUE)))
    print(paste(exportfilename,"- file summarised"))
    totalpathname <- paste0(exportfolder,exportfilename)
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

lettercaller()