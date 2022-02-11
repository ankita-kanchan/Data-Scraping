library(shiny)

stud = c("Alex","jae","Max")
gen=c("Male","Female")
ui <- navbarPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  "my nav page",
  tabPanel("Text Input",
           textInput("name","Enter your name:"),
           passwordInput("password","Enter your password:"),
           textAreaInput("address","Enter your Address",rows=3),
  ),
  tabPanel("Numeric Input",
           numericInput("num","Enter the number",value = 0,min = 0, max=100),
           sliderInput("slide1","Select your number",value=50,min=0,max=100),
           sliderInput("rangeSlide","Range",value = c(10,20),min=0,max=100),
           
  ),
  tabPanel("Date Input",
           dateInput("dob","Enter your Birth Date:"),
           dateRangeInput("leave","Enter start and end date of your leave:")
  )
  ,navbarMenu("subpanels",
              tabPanel("Limited Input",
                       selectInput("students","Select Student",stud,multiple = TRUE),
                       radioButtons("gender","Select Gender",gen),
                       checkboxGroupInput('stud',"Select Students",stud)
                       
              ),
              tabPanel("File Input",
                       fileInput("upload","Enter your profile picture") ,
                       actionButton("click","Click Here", class="btn-warning btn-lg")
              )
              )
  
              )
  # sidebarLayout(
  #   sidebarPanel(
  #     textOutput("panel")
  #   )
  #   ,mainPanel(
  #     tabsetPanel(
  #       id="mytab",
  #       tabPanel("Text Input",
  #                textInput("name","Enter your name:"),
  #                passwordInput("password","Enter your password:"),
  #                textAreaInput("address","Enter your Address",rows=3),
  #       ),
  #       tabPanel("Numeric Input",
  #                numericInput("num","Enter the number",value = 0,min = 0, max=100),
  #                sliderInput("slide1","Select your number",value=50,min=0,max=100),
  #                sliderInput("rangeSlide","Range",value = c(10,20),min=0,max=100),
  #                
  #       ),
  #       tabPanel("Date Input",
  #                dateInput("dob","Enter your Birth Date:"),
  #                dateRangeInput("leave","Enter start and end date of your leave:")
  #       )
  #     )
  #   )
  # ),
  
  # navlistPanel(
  #   id="mynav",
  #           "nav 1",
  #           tabPanel("Text Input",
  #                    textInput("name","Enter your name:"),
  #                    passwordInput("password","Enter your password:"),
  #                    textAreaInput("address","Enter your Address",rows=3),
  #           ),
  #           "nav 2",
  #           tabPanel("Numeric Input",
  #                    numericInput("num","Enter the number",value = 0,min = 0, max=100),
  #                    sliderInput("slide1","Select your number",value=50,min=0,max=100),
  #                    sliderInput("rangeSlide","Range",value = c(10,20),min=0,max=100),
  # 
  #           ),
  #           "nav 2",
  #           tabPanel("Date Input",
  #                    dateInput("dob","Enter your Birth Date:"),
  #                    dateRangeInput("leave","Enter start and end date of your leave:")
  #           )
  #         
  # )
  
  
  
  


server <- function(input, output) {
 output$panel = renderText({
  paste("Current Panel is",input$mytab)
 })
  
}


shinyApp(ui = ui, server = server)
