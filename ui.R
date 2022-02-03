library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = "selected_store",
    label = "Select Store",
    choices = unique(sales_df$scode)
  ),

  selectInput(
    inputId = "selected_sku",
    label = "Select SKU",
    choices = unique(sales_df$pcode)
  ),
  plotOutput("ts.plot"),
  verbatimTextOutput("debug")
)
