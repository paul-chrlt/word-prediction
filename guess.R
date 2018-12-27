setwd("/home/paul/workspace/coursera/capstone")
summarisedfolder <- "./summarisedbyletter/"
lightfolder <- "./lightletters/"
library(quanteda)
library(stringr)

phrase <- readline("phrase ?")

sanitizer <- function(sourcetext){
    sourcetext <- tokens_tolower(tokens(sourcetext,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE))
    sourcetext <- paste0(sourcetext,collapse = "_")
    sourcetext
}

lasttwo <- tail(as.character(sourcetext),2)
lastone <- tail(as.character(sourcetext),1)
lasttwo <- paste(lasttwo,sep = "_")
lastone <- paste(lastone,sep = "_")

searchinsummary <- function(){
    phrase <- readline("phrase ?")
    phrase <- sanitizer(phrase)
    firstletter <- str_trunc(phrase,1,ellipsis = "")
    load(paste0(lightfolder,firstletter))
    frequences <- frequences[order(frequences$count,decreasing = TRUE),]
    pattern <- paste0("^",phrase,"_")
    results <- grep(pattern,frequences$words)
    head(frequences[results,],10)
}

searchinsummary()
