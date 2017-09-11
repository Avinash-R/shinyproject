## The Chatterjee-Price Attitude data in datasets package is used for this shiny App.

## The Overall Rating and its six dependent features are recorded in this data

## We try to predict the Overall rating based on a single feature viz., handling 
## complaints by using a simple linear regression. 

## More details about the data is available here: 
## https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/attitude.html



## The user interface has 3 parts - title, sidebar and main panels
## Using the sidebar panel one can input favourable responses on handling complaints
## The main panel shows the model fit and interactive output

library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Overall Rating from Favourable Responses"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderComp", "How well are the complaints 
                                    handled?", 37, 90, value = 60),
                        checkboxInput("showModel", "Show/Hide Model", value = TRUE),
                        submitButton("Submit") 
                ),
                mainPanel(
                        plotOutput("plot"),
                        h3("Predicted Overall Rating from Model:"),
                        textOutput("pred")
                )
        )
))