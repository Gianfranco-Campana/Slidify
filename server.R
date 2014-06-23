library(shiny)
library(datasets)
data(iris)
shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("Petal.Length ~ ", input$explanatoryvariable)
    
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  formulaText1 <- reactive({
    paste("fit <- lm(Petal.Length ~ ", input$explanatoryvariable, ", data=iris)")
  })
  output$lmf <- ({  renderText(formulaText1() )})  

  formulaText2 <- reactive({
    if (input$explanatoryvariable != "Species")
    fit <- eval(parse(text=paste("lm(Petal.Length ~ ", input$explanatoryvariable, ", data=iris)")))$coef
    if (input$explanatoryvariable != "Species")
    eval(parse(text=paste("lm(Petal.Length ~ ", input$explanatoryvariable, ", data=iris)")))$coef
  })
  output$lmf <- ({  renderPrint(formulaText2() )})  
  
  
  
  formulaText3 <- reactive({
    if (input$explanatoryvariable != "Species")
    r <- eval(parse(text=paste("range(iris$", input$explanatoryvariable, ")", sep="")))
    
  })
  
  
  output$selectUI <- renderUI({ 
    if (input$explanatoryvariable != "Species")
    sliderInput("newvalue", "New value for prediction", value = (formulaText3()[1]+formulaText3()[2])/2, min = formulaText3()[1], max = formulaText3()[2], step = 0.01)
        })
  
 
 
 
 
 formulaText4 <- reactive({
   if (input$explanatoryvariable != "Species")
   fit <- eval(parse(text=paste("lm(Petal.Length ~ ", input$explanatoryvariable, ", data=iris)")))
   if (input$explanatoryvariable != "Species")
   paste("predict(fit,data.frame(", input$explanatoryvariable, "=", input$newvalue, "), data=iris)", sep="")
   
 })
 output$predf <- renderText({ formulaText4() })
 
 
 formulaText5 <- reactive({
   if (input$explanatoryvariable != "Species")
   fit <- eval(parse(text=paste("lm(Petal.Length ~ ", input$explanatoryvariable, ", data=iris)")))
   if (input$explanatoryvariable != "Species")
   eval(parse(text=paste("predict(fit,data.frame(", input$explanatoryvariable, "=", input$newvalue, "), data=iris)", sep="")))
   
 })
 
 
 output$labpred <- renderText(if (input$explanatoryvariable != "Species") "Petal Length predicted from model:")
 
 output$pred <- renderText({ formulaText5() })
 
 
 
 
 output$speciesplot <- renderPlot({
   if (input$explanatoryvariable != "Species") 
   plot(as.formula(formulaText()),  data = iris) 
   if (input$explanatoryvariable == "Species") 
   plot(as.formula(formulaText()),  data = iris, horizontal = T) 
   if (input$explanatoryvariable != "Species") 
   points(x=input$newvalue, y=formulaText5(), pch = 13, col="red", bg="red", cex=3)   
   })

 
 
 })
 




