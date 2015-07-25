library(shiny)

library(datasets)


#This builds a linear regression model which will be used to predict 
#mpg based on the user inputs
allvariablemodel <- lm(mpg ~ ., data = mtcars)
bestmodel <- step(allvariablemodel, direction = "both")
parsedmodel <- lm(mpg ~ wt + qsec + am, data = mtcars)
#Here the coefficients are taken out of the model and will be multiplied
#by whatever the user inputs



intercept <- bestmodel$coefficients[1]
weight <- bestmodel$coefficients[2]
qsec <- bestmodel$coefficients[3]
transmission <- bestmodel$coefficients[4]

shinyServer(
  
  function(input, output) {
    
    output$caption <- renderText({
      
      mpgPredict <- predict(parsedmodel,
        newdata = data.frame(wt=input$weight,qsec=input$qsec,
        am=as.integer(input$transmission)),interval = "confidence")
      
    paste("Your predicted MPG is between", round(mpgPredict[2],digits = 2),
          "and",round(mpgPredict[3],digits = 2))
    })
  
})