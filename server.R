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