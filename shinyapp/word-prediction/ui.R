library(shiny)

shinyUI(fluidPage(
    titlePanel("word prediction"),
    
    sidebarLayout(
        sidebarPanel(
            textInput("phrase","Phrase",width='100%'),
            submitButton(text="Guess the next word")
        ),
        
        mainPanel(
            tableOutput("suggestions")
            #       plotOutput("distPlot")
        )
    )
))
