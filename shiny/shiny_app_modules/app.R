library(shiny)
#waiter
ui <- fluidPage(

  actionButton("subscribe","Click here to Subscribe"),
)

server <- function(input, output) {
  modal_accept = modalDialog(
    "Are your sure?",
    title = "Subscribe to website",
    footer = tagList(
      actionButton("cancel","Cancel"),
      actionButton("accept","Subscribe",class="btn btn-info")
    )
  )
  observeEvent(input$subscribe,{
    showModal(modal_accept)
  })
  
  observeEvent(input$cancel,{
    removeModal(modal_accept)
  })
 
}

# Run the application 
shinyApp(ui = ui, server = server)
