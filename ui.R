library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Air Quality - Predict Ozone levels based on Temperature"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderTemp","Select the Temperature value", min = 56, max = 97, value = 60),
            submitButton("Predict") # SubmitButton is handy for delayed reactivity where your server.R function includes calculation intensive algorithm
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plt_Air"),
            h4("Predicted Ozone Level for the selected Temperature:"),
            textOutput("pred_val")
        )
    )
))