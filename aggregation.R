# setwd("/home/paul/workspace/coursera/capstone")
# frequencesfolder <- "./frequences/"
letterfrequencesfolder <- "./frequencesbyletter/"
letteraggregatedfolder <- "./aggregatedbyletter/"

frequencesfiles <- paste0(letterfrequencesfolder, list.files(letterfrequencesfolder))


library(data.table)
#library(dplyr)
aggregator <- function(frequencesfiles,filename){
    totalfrequences <- data.table(words=character(),count=integer())
    for (i in 1:length(frequencesfiles)){
        load(frequencesfiles[i])
#        frequencesdt <- data.table(words=names(frequences),count=frequences)
        totalfrequences <- rbind(totalfrequences,letter)
        print(paste("sample",i,"aggregated for file",filename))
    }
    print("saving fully aggregated letter")
    save(totalfrequences,file=paste0(letteraggregatedfolder,filename))
    print("saved")
}

lettercaller <- function(){
    for (i in letters){
        pattern <- paste0(i,"[0-9]*$")
        fileindices <- grep(pattern,frequencesfiles)
        aggregator(frequencesfiles[fileindices],i)
        print(paste("letter",i,"aggregated"))
    }
}

lettercaller()

#totalfrequences %>%
#    group_by(words) %>%
#    summarise_all(funs(sum(count,na.rm=TRUE)))