# setwd("/home/paul/workspace/coursera/capstone")
# summarisedfolder <- "./summarisedbyletter/"
lightfolder <- "./lightletters/"
library(quanteda)
library(stringr)

sanitizer <- function(sourcetext){
    sourcetext <- tokens_tolower(tokens(sourcetext,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE))
    lasttwo <- tail(as.character(sourcetext),2)
    paste0(lasttwo,collapse = "_")
}

searchinsummary <- function(phrase,locationfolder=lightfolder){
    phrase <- sanitizer(phrase)
    firstletter <- str_trunc(phrase,1,ellipsis = "")
    load(paste0(locationfolder,firstletter))
    frequences <- frequences[order(frequences$count,decreasing = TRUE),]
    pattern <- paste0("^",phrase,"_")
    results <- grep(pattern,frequences$words)
    head(frequences[results,],10)
}

#phrase <- readline("phrase ?")
print("guess is loaded")