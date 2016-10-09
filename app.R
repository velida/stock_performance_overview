#title:Stock Performance Overview for TDC, ORCL, IBM
#author: Elida Vaccea


library(shiny)
library(plotly)

datas <- read.csv2("TDC_ORCL_IBM_Stock.csv", header=TRUE, sep=";", dec =",", na.strings="NA")

datas$date <- as.Date(datas$date,"%d.%m.%Y")

# UI
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Stock TDC, ORCL, IBM"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         dateInput("date1", label = h3("Start Date"), value = "2015-10-06"),
         dateInput("date2", label = h3("End Date"), value = "2016-10-06"),
         checkboxInput("show_TDC", "Show/Hide TDC", value = TRUE),
         checkboxInput("show_ORCL", "Show/Hide ORCL", value = TRUE),
         checkboxInput("show_IBM", "Show/Hide IBM", value = TRUE)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         tabsetPanel(type = "tabs", 
                     tabPanel("Plot", plotlyOutput("plot")), 
                     tabPanel("Table", tableOutput("table"))
                    )
      )
  )
))

# Server logic 
server <- shinyServer(function(input, output) {

  output$plot <- renderPlotly({

   #Filter the data frame according to the selected dates 
    filtered <- datas %>%
      filter(date >= input$date1,
             date <= input$date2,
             Stock %in% c(ifelse(input$show_TDC, "TDC", ""),ifelse(input$show_ORCL, "ORCL", ""),ifelse(input$show_IBM, "IBM", "")))
   
    #get the row index for the start date
   i1 <- which(filtered$date == input$date1 & filtered$Stock == "TDC")
   i2 <- which(filtered$date == input$date1 & filtered$Stock == "ORCL")
   i3 <- which(filtered$date == input$date1 & filtered$Stock == "IBM")
   
   #get the value of close price for the start date
   st1 <- filtered[i1,3]
   st2 <- filtered[i2,3]
   st3 <- filtered[i3,3]
   
   filtered[,"change"] <- NA
   
   for (i in 1:nrow(filtered)){
     if (filtered[i,1]=="TDC") { 
        filtered[i,8] <- (filtered[i,3]/st1 - 1)*100
      } else if (filtered[i,1]=="ORCL") {
        filtered[i,8] <- (filtered[i,3]/st2 - 1)*100
      } else if (filtered[i,1]=="IBM") {
        filtered[i,8] <- (filtered[i,3]/st3 - 1)*100
      }
   }
   
    plot_ly(filtered, mode = "lines", x = filtered$date, y = filtered[,8], color = as.character(filtered$Stock, mode)) %>%
    #add_lines() %>%
    layout(
      title = "Performance overview 2015/10/06 - 2016/10/06",
      xaxis = list(
        rangeselector = list(
          y = 0,
          buttons = list(
            list(
              count = 6,
              label = "6 mo",
              step = "month",
              stepmode = "backward"),
            list(
              count = 1,
              label = "1 yr",
              step = "year",
              stepmode = "backward"),
            list(step = "all"))),
        
        rangeslider = list(type = "date")),
      
      yaxis = list(title = "Performance (%)"))
   })
  
  output$table <- renderTable({
    #Filter the data frame according to the selected dates 
    filtered <- datas %>%
      filter(date >= input$date1,
             date <= input$date2,
             Stock %in% c(ifelse(input$show_TDC, "TDC", ""),ifelse(input$show_ORCL, "ORCL", ""),ifelse(input$show_IBM, "IBM", "")))
    
    #get the row index for the start date
    i1 <- which(filtered$date == input$date1 & filtered$Stock == "TDC")
    i2 <- which(filtered$date == input$date1 & filtered$Stock == "ORCL")
    i3 <- which(filtered$date == input$date1 & filtered$Stock == "IBM")
    
    #get the value of close price for the start date
    st1 <- filtered[i1,3]
    st2 <- filtered[i2,3]
    st3 <- filtered[i3,3]
    
    filtered[,"change"] <- NA
    
    for (i in 1:nrow(filtered)){
      if (filtered[i,1]=="TDC") { 
        filtered[i,8] <- (filtered[i,3]/st1 - 1)*100
      } else if (filtered[i,1]=="ORCL") {
        filtered[i,8] <- (filtered[i,3]/st2 - 1)*100
      } else if (filtered[i,1]=="IBM") {
        filtered[i,8] <- (filtered[i,3]/st3 - 1)*100
      }
    }
    #filtered$date <- as.factor(datas$date)
    data.frame(filtered)
  })
}
)

# Run the application 
shinyApp(ui = ui, server = server)

