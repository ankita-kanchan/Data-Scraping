

library(shiny)
library(ggplot2)
products= read.csv("C://Users//ankit//Documents//injuries_products.csv")
products
data= read.csv("C://Users//ankit//Documents//injuries_data.csv")
data
population= read.csv("C://Users//ankit//Documents//injuries_population.csv")
population
#set names for the product dropdown
prod_codes = setNames(products$prod_code,products$title)

ui <- fluidPage(
  
    #product dropdown ui
    fluidRow(
      column(
        8,
        selectInput("code","Select Products",prod_codes)
      )
    ),
    # displaying data related to injuries
    fluidRow( class="justify-content-center",
      column(5,"Location Count",dataTableOutput("location"),
             style="background-color:#eee;border-radius:20px;margin:20px;padding:10px"),
      column(5,"Diagnosis Count",dataTableOutput("diag"),
             style="background-color:#eee;border-radius:20px;margin:20px;padding:10px"),
     
    ),
    fluidRow(class="justify-content-center",
      column(5,"Body Parts",dataTableOutput("bodyparts")
             ,style="background-color:#eee;border-radius:20px;margin:20px;padding:10px"),
      column(5,"Races",dataTableOutput("race")
             ,style="background-color:#eee;border-radius:20px;margin:20px;padding:10px")
    ),
    fluidRow(
      column(12,plotOutput("injury_plot"))
    )
)

server <- function(input, output) {
  prod_data = reactive(data %>% filter(prod_code==input$code))
  
   output$location  = renderDataTable(
     prod_data() %>% count(location,sort = TRUE),options = list(pageLength=5)
   )
   output$diag  = renderDataTable(
     prod_data() %>% count(diag,sort = TRUE),options = list(pageLength=5)
   )
   output$bodyparts  = renderDataTable(
     prod_data() %>% count(body_part,sort = TRUE),options = list(pageLength=5)
   )
   output$race  = renderDataTable(
     prod_data() %>% count(race,sort = TRUE),options = list(pageLength=5)
   )
   
   plot_data = reactive({
     prod_data()%>% count(age,sex) %>% left_join(population,by=c("age","sex")) %>% mutate(rate= n/population * 1e4)
   })
   
   output$injury_plot = renderPlot({
     plot_data() %>% ggplot(aes(age,n,color=sex))+geom_line(size=1)+
       labs(y="Estimated injuries count")
   })
}


shinyApp(ui = ui, server = server)

