
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyUI(fluidPage(

  # Application title
  titlePanel("Temperature prediction"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      h4('Enter the input parameter :'),
      numericInput('ozone', 'Ozone', 10, min = 1, max= 160, step = 10),
      sliderInput("radiation",
                  "Radiation:",
                  min = 0,
                  max = 100,
                  value = 10),
      numericInput('wind', 'Wind', 100, min = 50, max= 230, step = 5),
     
      submitButton('Submit')
    ),

    # Show the result of the prediction
    mainPanel(
      h3 ('Results of prediction'),
      h4 ('Temperature\'s Predicted:'),
      textOutput("prediction")    )
    
    
  )
))
