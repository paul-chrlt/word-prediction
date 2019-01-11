# setwd("/home/paul/workspace/coursera/capstone")
# summarisedfolder <- "./summarisedbyletter/"
summarisedfolder <- "./summarisedfbyletter/"
# exportfolder <- "./lightletters/"
exportfolder <- "./lightfletters/"
keeped <- .2
letterfiles <- paste0(summarisedfolder, list.files(summarisedfolder))

library(data.table)

clearer <- function(file,exportname){
    load(file)
    print(paste(exportname,"- file loaded"))
    deleted <- 1-keeped
    mincount <- quantile(totalfrequences$count,1-keeped)
    frequences <- totalfrequences[totalfrequences$count>mincount,]
    print(paste(exportname,"-",deleted*100,"% data cleared"))
    save(frequences,file = paste0(exportfolder,exportname))
    print(paste(exportname,"- file saved"))
}

lettercaller <- function(){
    for (i in 1:length(letters)){
        print(paste("calling database clearing for letter",letters[i]))
        clearer(letterfiles[i],letters[i])
        print(paste("letter",letters[i],"cleared"))
    }
}

lettercaller()
