library(shiny)
source("../../guess.R")
lightfolder <- "../../lightletters/"
shinyServer(function(input, output) {
    reactive({
        print("reactive")
        guessed <- searchinsummary(input$phrase)
    })
        output$suggestions <- renderTable(searchinsummary(input$phrase,lightfolder),striped = TRUE)
})