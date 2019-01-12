## function to convert each to absolute path
absolutepath <- function(relativepath){
    paste0(dirname(rstudioapi::getSourceEditorContext()$path),relativepath)
}
## text sources folder and files
sources <- "/source/Coursera-SwiftKey/final"
sources <- absolutepath(sources)
englishblogs <- paste0(sources,"/en_US/en_US.blogs.txt")
englishtwitter <- paste0(sources,"/en_US/en_US.twitter.txt")
englishnews <- paste0(sources,"/en_US/en_US.news.txt")

## sources will be truncated for memory performance, samplesize is the number of lines per sample
samplesize <- 50000

## folder structure, some are comments to keep multiple trials

sourcefolder <- "/sample/"
sourcefolder <- absolutepath(sourcefolder)

# letterfrequencesfolder <- "/frequencesbyletter/"
letterfrequencesfolder <- "/frequencesfbyletter/"
letterfrequencesfolder <- absolutepath(letterfrequencesfolder)

# letteraggregatedfolder <- "/aggregatedbyletter/"
letteraggregatedfolder <- "/aggregatedfbyletter/"
letteraggregatedfolder <- absolutepath(letteraggregatedfolder)

# summarisedfolder <- "/summarisedbyletter/"
summarisedfolder <- "/summarisedfbyletter/"
summarisedfolder <- absolutepath(summarisedfolder)

# lightfolder <- "/lightletters/"
lightfolder <- "/lightfletters/"
lightfolder <- absolutepath(lightfolder)

## ratio to keep in the clearance step
keeped <- .2

## test sources. First column is sentence beginning, second column is the word to guess
testsourcesfolder <- "/testsources/testsample.csv"
testsourcesfolder <- absolutepath(testsourcesfolder)