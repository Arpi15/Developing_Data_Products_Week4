#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Use a fluid Bootstrap layout
fluidPage(    
        
        # Give the page a title
        titlePanel("Covid-19 cases by states in Australia"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
                
                # Define the sidebar with inputs
                sidebarPanel(
                        selectInput("state", "State Name:", 
                                    choices=c("New South Wales" = "NSW",
                                               "Victoria" = "VIC",
                                               "Queensland" = "QLD", "South Australia" = "SA", "Western Australia" = "WA",
                                              "Tasmania" = "TAS", "Northern Territory" = "NT", "Australian Capital Territory" = "ACT")),
                        br(),
                        
                        selectInput("total_cases1", "Total cases by state:", 
                                    choices=c("New South Wales" = "NSW",
                                              "Victoria" = "VIC",
                                              "Queensland" = "QLD", "South Australia" = "SA", "Western Australia" = "WA",
                                              "Tasmania" = "TAS", "Northern Territory" = "NT", "Australian Capital Territory" = "ACT")),
                        br(),
                        
                        actionButton("goButton", "Go!"),
                        p("Click the button to get total cases displayed in the main panel."),
                        
                        hr(),
                        helpText("Data from Aus Gov website")
                ),
                
                # Create a spot for the barplot
                mainPanel(
                        h3("Number of Cases Since January till June"),
                        plotOutput("covidPlot"),
                        verbatimTextOutput("total_cases1Text")
                )
                
        )
)
