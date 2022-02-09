
library(shiny)
library(shinyWidgets)
library(shinythemes)
library(plotly)
library(tidyverse)
library(tidyquant)

tickers = c("DRREDDY.NS","BRITANNIA.NS","JUBLFOOD.NS","ASIANPAINT.NS") 
benchmarks =c("^NSEI","^BSESN")
prices = tq_get(tickers,get="stock.prices",from= today()-months(12),
                to=today(),
                complete_cases = F) %>% select(symbol,date,open,high,low,close)

bench = tq_get(benchmarks,get="stock.prices",from= today()-months(12),
               to=today(),
               complete_cases = F) %>% select(symbol,date,open,high,low,close)

ui <- navbarPage(
  "Stock Portfolio",
  tabPanel("monitor",sidebarLayout(
    sidebarPanel(width = 3,
                 pickerInput(
                   inputId = "stocks",
                   label = h5("Stocks"),
                   choices = c(
                     "Dr. Reddy's Laboratories Limited" = tickers[1],
                     "Britannia Industries Limited " = tickers[2],
                     "Jubilant FoodWorks Limited"=tickers[3],
                     "Asian Paints Limited"=tickers[4]
                   ),
                   selected=tickers,
                   options = list('actions-box'=TRUE),
                   multiple = T
                 ),
                 radioButtons(inputId = "benchmarks",label=h5("Benchmarks"),
                              choices = list("^NSEI"=1,"^BSESN"=2,"None"=3),
                              selected = 3),
                 
                 radioButtons(inputId = "period",label=h5("Time Period"),
                              choices = list("1 Month"=1,"3 Months"=2,"6 Months"=3,"12 Months"=4,"Year"=5),
                              selected = 4),
                 ),mainPanel(
                   plotlyOutput("plot",width="100%")
                 )
    
  )
  ),
    tabPanel("DRREDDY.NS", plotlyOutput("stock1")),
    tabPanel("BRITANNIA.NS", plotlyOutput("stock2")),
    tabPanel("JUBLFOOD.NS", plotlyOutput("stock3")),
    tabPanel("ASIANPAINT.NS", plotlyOutput("stock4")),
    
   
)

server <- function(input, output) {
  observeEvent(c(input$period,input$stocks,input$benchmarks),{
      prices <- prices %>%
        filter(symbol %in% input$stocks)
      
      if (input$period == 1) {
        prices <- prices %>%
          filter(date >= today()-months(1)) }
      
      if (input$period == 2) {
        prices <- prices %>%
          filter(date >= today()-months(3)) }
      
      if (input$period == 3) {
        prices <- prices %>%
          filter(date >= today()-months(6)) }
      
      if (input$period == 5) {
        prices <- prices %>%
          filter(year(date) == year(today())) }
      
      if (input$benchmarks == 1) {
        bench <- bench %>%
          filter(symbol=="^NSEI",
                 date >= min(prices$date))
        prices <- rbind(prices,bench) }
      
      if (input$benchmarks == 2) {
        bench <- bench %>%
          filter(symbol=="^BSESN",
                 date >= min(prices$date))
        prices <- rbind(prices,bench) }
      
      output$plot <- renderPlotly({
        print(
          ggplotly(prices %>%
                     group_by(symbol) %>%
                     mutate(init_close = if_else(date == min(date),close,NA_real_)) %>%
                     mutate(value = round(100 * close / sum(init_close,na.rm=T),1)) %>%
                     ungroup() %>%
                     ggplot(aes(date, value,colour = symbol)) +
                     geom_line(size = 1, alpha = .9) 
          )
        )
      })
      
    })
  output$stock1 = renderPlotly(
    {
      print(
        ggplotly( prices %>% filter(symbol=="DRREDDY.NS") %>%
                    plot_ly(x=~date,type="candlestick",
                            open=~open,close=~close,
                            high=~high,low=~low)
        )
        
      )
    }
  )
  output$stock2 = renderPlotly(
    {
      print(
        ggplotly( prices %>% filter(symbol=="BRITANNIA.NS") %>%
                    plot_ly(x=~date,type="candlestick",
                            open=~open,close=~close,
                            high=~high,low=~low)
        )
        
      )
    }
  )
  output$stock3 = renderPlotly(
    {
      print(
        ggplotly( prices %>% filter(symbol=="JUBLFOOD.NS") %>%
                    plot_ly(x=~date,type="candlestick",
                            open=~open,close=~close,
                            high=~high,low=~low)
        )
        
      )
    }
  )
  output$stock4 = renderPlotly(
    {
      print(
        ggplotly( prices %>% filter(symbol=="ASIANPAINT.NS") %>%
                    plot_ly(x=~date,type="candlestick",
                            open=~open,close=~close,
                            high=~high,low=~low)
        )
        
      )
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
