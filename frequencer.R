## config import
library(rstudioapi)
source(paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/config.R"))
sourcefiles <- paste0(sourcefolder, list.files(sourcefolder))

##libraries
library(quanteda)
library(data.table)

##functions definition
splitbyletter <- function(frequencesdt,samplenumber){
    for (i in 1:26){
        pattern <- paste0("^",letters[i])
        letterindices <- grep(pattern,frequencesdt$words)
        letter <- frequencesdt[letterindices,]
        save(letter,file = paste0(letterfrequencesfolder,letters[i],samplenumber))
        print(paste("sample",samplenumber,"letter",letters[i],"saved"))
    }
}

frequencies <- function(sourcefiles) {
    for (i in 1:length(sourcefiles)) {
        load(sourcefiles[i])
        print(paste(i," loaded"))
        corpus <- corpus(sample)
        print(paste(i," in corpus"))
        corpus <- corpus_reshape(corpus,to="sentences",remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE)
        ngrams <- tokens(corpus, what = "word",ngrams = 1:3,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE) # added what = word
        print(paste(i," ngrammed"))
        documentfeature <- dfm(ngrams, remove = stopwords(source = "smart")) # smart source contains more stopwords
        print(paste(i," is a dfm"))
        documentfeature <- dfm_tfidf(documentfeature,scheme_tf = "prop")
        frequences <- docfreq(documentfeature,scheme="inverse")
        frequences <- data.table(words=names(frequences),count=frequences)
        print(paste(i," frequenced"))
        splitbyletter(frequences,i)
    }
}

## function call
frequencies(sourcefiles)
