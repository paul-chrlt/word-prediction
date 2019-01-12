## config import
library(rstudioapi)
source(paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/config.R"))
sourcefiles <- paste0(sourcefolder, list.files(sourcefolder))

## libraries

library(quanteda)
library(stringr)

## function definition

sanitizer <- function(sourcetext){
    sourcetext <- tokens_tolower(tokens(sourcetext,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE))
    lasttwo <- tail(as.character(sourcetext),2)
    paste0(lasttwo,collapse = "_")
}

readableresult <- function(table,number = 1){
    words <- head(table$words,number)
    words <- str_extract(words,"_[a-z]*$")
    paste0(gsub("_","",words),collapse = ", ")
}

searchinsummary <- function(phrase,locationfolder=lightfolder){
    phrase <- sanitizer(phrase)
    firstletter <- str_trunc(phrase,1,ellipsis = "")
    load(paste0(locationfolder,firstletter))
    frequences <- frequences[order(frequences$count,decreasing = TRUE),]
    pattern <- paste0("^",phrase,"_")
    results <- grep(pattern,frequences$words)
    frequences[results,]
#    head(frequences[results,],10)
    readableresult(frequences[results,],3)
}
