
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)


data <- getURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/ozone.data")
ozone <- read.csv(text = data, sep="\t") 
modFit <- train(temperature~ .,data=ozone,method="rf",prox=TRUE)

shinyServer(function(input, output) {

  output$prediction <- renderPrint ({
    ozone = input$ozone
    radiation = input$radiation
    wind = input$wind
    predict(modFit,data.frame(ozone, radiation, wind))})
}
)
