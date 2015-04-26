
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)
library(ElemStatLearn); data(ozone,package="ElemStatLearn")
ozone <- ozone[order(ozone$ozone),]

modFit <- train(temperature~ .,data=ozone,method="rf",prox=TRUE)

shinyServer(function(input, output) {

  output$prediction <- renderPrint ({
    ozone = input$ozone
    radiation = input$radiation
    wind = input$wind
    predict(modFit,data.frame(ozone, radiation, wind))})
}
)