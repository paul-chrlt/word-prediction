setwd("/home/paul/workspace/coursera/capstone")
summarisedfolder <- "./summarisedbyletter/"
lightfolder <- "./lightletters/"
library(quanteda)

phrase <- readline("phrase ?")

sanitizer <- function(sourcetext){
    sourcetext <- tokens_tolower(tokens(sourcetext,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE))
    sourcetext
}

lasttwo <- tail(as.character(sourcetext),2)
lastone <- tail(as.character(sourcetext),1)
lasttwo <- paste(lasttwo,sep = "_")
lastone <- paste(lastone,sep = "_")

searchinsummary <- function(){
    phrase <- readline("phrase ?")
    sanitizer(phrase)
}

load(paste0(lightfolder,"a"))

frequences <- frequences[order(frequences$count,decreasing = TRUE),]

pattern <- "^and_i'd_"


results <- grep(pattern,frequences$words)
head(frequences[results,],60)