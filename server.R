## The input from the ui.R is taken by server.R which performs data analysis and 
## returns output to the ui.R 

## First a simple linear model is fitted and prediction is done based on the fit and 
## input from ui.R. The predicted value is sent to ui.R
## In the second part, a interactive plot is made using the data and fit. 

library(shiny)
shinyServer(function(input, output) {
        modelFit <- lm(rating ~ complaints, data = attitude)
        
        modelPred <- reactive({
                compInput <- input$sliderComp
                predict(modelFit, newdata = data.frame(complaints = compInput))
        })
        
        output$pred <- renderText({
                modelPred()
        })
        
        output$plot <- renderPlot({
                compInput <- input$sliderComp
                
                plot(x=attitude$complaints, y=attitude$rating, 
                     xlab = "Handling of employee complaints", ylab = "Overall Rating", 
                     bty = "o", pch = 4, col="gold2",
                     xlim = c(37, 90), ylim = c(40, 85))
                if(input$showModel){
                        abline(modelFit, col = "blue", lwd = 2)
                }
                
                points(compInput, modelPred(), col = "red", pch = 16, cex = 2)
                
        })
        
        
})