library(shiny)

server <- function(input, output) {
  output$debug <- renderPrint({
    input$selected_store
    input$selected_sku

    sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
  })

  output$ts.plot <- renderPlot({
    plot.df <- sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
    autoplot(plot.df)
  })
}
