setwd("/home/paul/workspace/coursera/capstone")
sourcefolder <- "./sample/"
sourcefiles <- paste0(sourcefolder, list.files(sourcefolder))
letterfrequencesfolder <- "./frequencesbyletter/"

library(quanteda)
library(data.table)

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
        ngrams <- tokens(corpus, ngrams = 1:3,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE)
        print(paste(i," ngrammed"))
        documentfeature <- dfm(ngrams, remove = stopwords())
        print(paste(i," is a dfm"))
        documentfeature <- dfm_tfidf(documentfeature)
        frequences <- docfreq(documentfeature)
        frequences <- data.table(words=names(frequences),count=frequences)
        print(paste(i," frequenced"))
        splitbyletter(frequences,i)
    }
}

frequencies(sourcefiles)
