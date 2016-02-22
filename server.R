# Server code
library(shiny)

source("DataProductsProject.R")

# Define a server for the Shiny app
shinyServer(function(input, output) {
        
        # Create the plot based on the input parameters
        output$fruitPlot <- renderPlot({
                if (input$submit==0)
                        return()
                isolate({p <- plotFruits(input$income, input$gender,
                           input$age, input$weight,
                           input$education, input$race)
                print(p)
                })
        })
})