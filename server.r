library(shiny)

yearsToFI <- function(r, b, i) {
  effRate <- (r - i)/100.0
  effPostRate <- (b - i)/100.0
  function (x) {(1 / effRate)*log(1 + (1 - x)/x*effRate/(exp(effPostRate) - 1))}
}

shinyServer(
  
  function(input, output) {
    
    timeFunc <- reactive({
      s <- input$savingRate/100.0
      curve(yearsToFI(input$mktrate, input$bondrate, input$inflation)(x),
            from = 0.05, to = .95, ylim = c(0,50), xlab = "Savings Rate",
            ylab = "Years to FI")
    })
    output$SavingsRate <- renderText({
      s <- input$savingRate/100.0
      paste("Savings Rate: ", s)
    })
    output$YTR <- renderText({
      s <- input$savingRate/100.0
      retYears <- yearsToFI(input$mktrate, input$bondrate, input$inflation)(s)
      paste("Years to FI: ", round(retYears, 1))
    })
    output$TPlot <- renderPlot({
      timeFunc()
      s <- input$savingRate/100.0
      retYears <- yearsToFI(input$mktrate, input$bondrate, input$inflation)(s)
      lines(c(s,s), c(retYears - 1,retYears + 1), col="red", lwd=5)
    })
  }
)