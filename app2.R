library(shiny)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("COURSE SHINY APP"),
  
  "This is the course shiny app. It is created during the course 
  exercises using the europe.rds data: 
  Average daily temperatures (in Fahrenheit) from cities around
  Europe from 2000 to 2019",
  
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      "This is the sidebar panel",
      
      # Input: A simple slider ----
      sliderInput(inputId = "year", label = "Year",
                  min = 1975,
                  max = 2015,
                  value = 1975,
                  sep = ""),
      
      # Input: A simple drop down list  ----
      selectInput(inputId = "storm_name", label = "Storm Name:",
                  choices = c(unique(demo_data$Name))),
      
      # Input: A simple text input  ----
      textInput(inputId = "storm_status", label = "Status"),
      
      
      #Radio ----
      radioButtons(inputId = "radio", label= "Radio Label",
                   choices= list("H"= "hurricane", "TD"= "Tropical Depresion" = 2, "TS"= "Tropical Storm"),
                   selected = 2)),
    
    # Main panel
    mainPanel(
      "This is the main panel",
      
      textOutput(outputId = "text_output"),
      
      # Layout: Tabset with info, data, and plots tabs ----
      tabsetPanel(type = "tabs",
                  tabPanel(title = "Info"),
                  tabPanel(title = "Data"),
                  tabPanel(title = "Plots")
      )
    )
    
    )
  )


# Define server side logic
server <- function(input, output) {
  
  output$text_output <- renderText({
    print(input$slider1)
    
    # Display text input
    paste("Your inputs are:", input$year, input$stormname, input$text_input, input$radio_1)
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
