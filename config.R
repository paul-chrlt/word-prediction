## text sources folder and files
sources <- "./source/Coursera-SwiftKey/final"
englishblogs <- paste0(sources,"/en_US/en_US.blogs.txt")
englishtwitter <- paste0(sources,"/en_US/en_US.twitter.txt")
englishnews <- paste0(sources,"/en_US/en_US.news.txt")

## sources will be truncated for memory performance, samplesize is the number of lines per sample
samplesize <- 50000

## folder structure, some are comments to keep multiple trials

sourcefolder <- "./sample/"

# letterfrequencesfolder <- "./frequencesbyletter/"
letterfrequencesfolder <- "./frequencesfbyletter/"

# letteraggregatedfolder <- "./aggregatedbyletter/"
letteraggregatedfolder <- "./aggregatedfbyletter/"

# summarisedfolder <- "./summarisedbyletter/"
summarisedfolder <- "./summarisedfbyletter/"

# lightfolder <- "./lightletters/"
lightfolder <- "./lightfletters/"

## ratio to keep in the clearance step
keeped <- .2