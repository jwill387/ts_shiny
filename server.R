library(shiny)

server <- function(input, output) {
  output$debug <- renderPrint({
    input$selected_store
    input$selected_sku

    sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
  })

  output$ts.plot <- renderPlot({
    min.date <- input$selected_date_range[1]
    max.date <- input$selected_date_range[2]

    plot.df <- sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]

    plot.df <- plot.df[plot.df$date >= min.date, ]
    plot.df <- plot.df[plot.df$date <= max.date, ]

    autoplot(plot.df)
  })
}
