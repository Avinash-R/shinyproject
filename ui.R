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
                        h4("About Data"),
                        h5("The Chatterjee-Price Attitude data in datasets 
                           package is used for this shiny App. The Overall 
                           Rating and the six features (Handling of employee 
                           complaints, Does not allow special privileges, 
                           Opportunity to learn, Raises based on performance, 
                           Too critical and Advancement) on which it depends 
                           are recorded in this data"),
                        h5("More details about the data is available here:
                           https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/attitude.html"),
                        h4("About Data Analysis"),
                        h5("We try to predict the Overall rating based on a 
                           single feature viz., handling complaints by using 
                           a simple linear regression model."),
                        h4("How to use the Shiny app?"),
                        h5("The user interface has 3 parts - title, sidebar 
                           and main panels. Using the sidebar panel one can 
                           input percent of favourable responses on handling 
                           complaints. The main panel shows an interactive plot
                           (with the model fit & prediction) along with the
                           prediction value reading"),
                        h4("What happens in the background?"),
                        h5("Simply put, the input from the ui.R is taken by 
                           server.R which performs data analysis and returns 
                           output to the ui.R."),
                        h5("Inside the server.R, First a simple linear model 
                           is fitted and prediction is done based on the fit & 
                           the input from ui.R. The predicted value is then 
                           sent to ui.R. In the second part, a interactive plot 
                           is made using the data, model fit and prediction. The 
                           plot is also then sent to ui.R"),
                        plotOutput("plot"),
                        h3("Predicted Overall Rating from Model:"),
                        textOutput("pred")
                )
        )
))