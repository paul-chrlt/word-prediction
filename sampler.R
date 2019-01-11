##Base variables

source(config.R)

##Getting the lines

library(data.table)

getenLines <- function(lines=-1,filename){
    tempConnection <- file(filename,"r")
    templines <- readLines(tempConnection,lines)
    close(tempConnection)
    data.table(templines)
}

lines <- rbind(getenLines(filename=englishblogs),getenLines(filename=englishtwitter),getenLines(filename = englishnews))

## Splitting lines as samples and saving each as a corpus

library(R.utils)
totallines <- countLines(englishblogs)[1] + countLines(englishnews)[1] + countLines(englishtwitter)[1]

samplesrange <- 1:round(totallines/samplesize)

sampler <- function(range,fulldata,samplesize){
    for (i in range){
        from<-i*samplesize-(samplesize-1)
        to<-i*samplesize
        sample <- fulldata[from:to]
        names(sample) <- "text"
        save(sample,file=paste0("./sample/","sample",i))
        print(paste(i," processed"))
    }
}

sampler(samplesrange,lines,samplesize)
