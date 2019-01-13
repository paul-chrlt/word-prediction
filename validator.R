## config import
library(rstudioapi)
source(paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/config.R"))
source(paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/guess.R"))

testsize <- 100

## libraries
library(data.table)

## data cleaning
library(stringr)

splitsentences <- function(fullsentences){
    fullsentences <- tokens_tolower(tokens(fullsentences,remove_numbers=TRUE,remove_punct=TRUE,remove_symbols=TRUE,remove_separators=TRUE,remove_twitter=TRUE,remove_url=TRUE))
    firstwords <- character()
    lastword <- character()
    for (i in 1:length(fullsentences)){
        characters <- as.character(fullsentences[i])
        length <- length(characters)
        firstletter <- str_trunc(characters,1,ellipsis = "")
        if(length >1 && (sum(firstletter == letters)==1)){
            firstwords <- append(firstwords,paste(characters[1:length-1],collapse = " "))
            lastword <- append(lastword,characters[length])
        }
    }
    cbind(firstwords,lastword)
}
source <- "./testsources/1000sents.csv"
source <- read.csv(source,stringsAsFactors = FALSE)
source <- source$EXAMPLE..EN.
source <- source[1:600]
cleanedfile <- splitsentences(source)
cleanedfile <- cleanedfile[-c(142:153),]
write.csv(cleanedfile,"./testsources/englishsentences.csv")

## function definition

linetest <- function(input,solution,lightfolder,targetresults =3){
    print(paste("calling guess.R",input,solution))
    results <- searchinsummary(input,lightfolder,targetresults)
    print(paste("grepping",results))
    str_count(results,solution)
#    grep(solution,results)
}

linetestcaller <- function(file,lightfolder,testsize,targetresults=3){
    totalresults <- integer()
    file <- read.csv(file,stringsAsFactors = FALSE)
#    testlines <- file[sample.int(testsize,n=length(file[,1])),]
    testlines <- file[1:100,]
    for (i in 1:length(testlines[,1])){
        print(paste("sentence",i))
        result <- linetest(testlines[i,2],testlines[i,3],lightfolder,targetresults)
        if(result>0){result<-TRUE}else{result<-FALSE}
        print(result)
        totalresults <- append(totalresults,result)
    }
    totalresults
}

oneresult <- linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,1)
fourresults <- linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,4)
sixresults <- linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,6)
tenresults <- linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,10)

# fresults <- linetestcaller("./testsources/englishsentences.csv","./lightfletters/",testsize,10)

## 23/100 with three results
## 27/100 with five results
## 35/100 with ten results
## 44/100 with tenresults | fsources

## combined
combinedtwo <- sum(linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,1)|linetestcaller("./testsources/englishsentences.csv","./lightfletters/",testsize,1))
combinedfour <- sum(linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,2)|linetestcaller("./testsources/englishsentences.csv","./lightfletters/",testsize,2))
combinedsix <- sum(linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,3)|linetestcaller("./testsources/englishsentences.csv","./lightfletters/",testsize,3))
combinedten <- sum(linetestcaller("./testsources/englishsentences.csv","./lightletters/",testsize,5)|linetestcaller("./testsources/englishsentences.csv","./lightfletters/",testsize,5))