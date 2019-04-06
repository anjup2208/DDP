library(shiny)
data("airquality")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # Clean the Data
    air<-na.omit(airquality)
    oz<-air$Ozone
    Temp<-air$Temp
    lm_fit<-lm(oz~Temp)
    
    #Calcuclate the value for Ozone based on selected Temperature
    model1pred<-reactive({
        TempInput<-input$sliderTemp
        predict(lm_fit, newdata=data.frame(Temp=TempInput))
    })
    
    # Plot the original data as scatter plot and also add the predicted value as point
    output$plt_Air<-renderPlot({
        TempInput<-input$sliderTemp
        plot(airquality$Temp, airquality$Ozone, xlab = "Temperature", ylab = "Ozone", bty="n", pch=16)
        abline(lm_fit,col="blue",lwd=2)
        points(TempInput, model1pred(), col="red", pch=16, cex=2)
    })
    
   # Output the predicted value as Text
    output$pred_val<-renderText({
        model1pred()    })
    
})