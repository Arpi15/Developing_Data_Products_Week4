#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define a server for the Shiny app
function(input, output) {
        data <- read.csv('cases_daily_state.csv')
        new_data <- data
        total_cases <- c(sum(new_data$NSW), sum(new_data$VIC), sum(new_data$QLD), sum(new_data$SA), sum(new_data$WA), sum(new_data$TAS), sum(new_data$NT), sum(new_data$ACT))
        total_cases
        total_cases_NSW <- total_cases[[1]][1]
        total_cases_VIC <- total_cases[[2]][1]
        total_cases_QLD <- total_cases[[3]][1]
        total_cases_SA <- total_cases[[4]][1]
        total_cases_WA <- total_cases[[5]][1]
        total_cases_TAS <- total_cases[[6]][1]
        total_cases_NT <- total_cases[[7]][1]
        total_cases_ACT <- total_cases[[8]][1]
        
        total_cases1text <- eventReactive(input$goButton, {
                
                if(input$state == "NSW") return(total_cases_NSW)
                if(input$state == "VIC") return(total_cases_VIC)
                if(input$state == "QLD") return(total_cases_QLD)
                if(input$state == "SA") return(total_cases_SA)
                if(input$state == "WA") return(total_cases_WA)
                if(input$state == "TAS") return(total_cases_TAS)
                if(input$state == "NT") return(total_cases_NT)
                if(input$state == "ACT") return(total_cases_ACT)
                
        })
        
        # Fill in the spot we created for a plot
        output$covidPlot <- renderPlot({
                
                # Render a barplot
                barplot(data[,input$state], 
                        main=input$state,
                        ylab="Number of Covid Cases",
                        xlab="Date", border = "red", col = "blue", space = 10, width = 10, names.arg = data$Date)
                
                
        })
        output$total_cases1Text <- renderText({
                total_cases1text()
        })
}











