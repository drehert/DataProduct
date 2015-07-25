library(shiny)

library(datasets)

#These are values taken from the mtcars dataset 
#This first one is the min, max, and mean values from the weight variable
wtmin <- round(min(mtcars$wt),1)
wtmax <- round(max(mtcars$wt),1)
wtmean <- round(mean(mtcars$wt),1)
#Likewise for the quarter second mile times
qsecmin <- round(min(mtcars$qsec))
qsecmax <- round(max(mtcars$qsec))
qsecmean <- round(mean(mtcars$qsec))

shinyUI(fluidPage(
  titlePanel("Predicting Gas Mileage"),
    br(),
    p("You choose the attributes of the car you want to drive.
       The app will tell you what that car's gas mileage will be."),
  
  sidebarPanel(
    helpText("How heavy do want this jalopy to be?"),
    sliderInput("weight",label = "Weight (1000 lbs)",min = wtmin,max = wtmax,
                value = wtmean),
    br(),
    helpText("Vroom, Vroom! How fast can this clunker move?"),
    sliderInput("qsec",label = "1/4 Mile Time (Seconds)",min = qsecmin,max = qsecmax,
                value = qsecmean),
    br(),
    helpText("Stick shift or kiddie car?"),
    radioButtons("transmission",label = p("Transmission Type"),
                 choices = list("Automatic" = 0,"Manual" = 1))
  ),
  
  mainPanel(
    textOutput("caption")
  )
)
)