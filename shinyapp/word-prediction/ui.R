library(shiny)

shinyUI(fluidPage(
    titlePanel("word prediction"),
    
    fluidRow(
        column(1),
        column(10,
            textInput("phrase","Phrase",width='100%'),
            submitButton(text="Guess the next word")
        ),
        column(1)
        ),
    fluidRow(
        column(1),
        column(10,
            textOutput("suggestions")
        ),
        column(1)
    )
    )
)
