library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Financial Independence"),
  
  sidebarPanel(
    h3('Interest and Saving Rates'),
    sliderInput('mktrate', 'Pre-FI Interest Rate %', value=9, min=0, max = 15, step = .5),
    sliderInput('bondrate', 'Post-FI Interest Rate %', value=4, min=0, max=15, step = .5),
    sliderInput('inflation', 'Inflation %', value = 2, min = 0, max = 10, step = .5),
    sliderInput('savingRate', 'Percentage of income which is saved', value = 50, min=5, max = 95, step = 5)
    ),
  mainPanel(
    h3('Years to Financial Independence (FI)'),
    p("Move the sliders on the left to see when your financial plans
      will lead to financial independence (i.e. your cost of living
      is exceeded by your interest-based income)."),
    p("Years-to-FI calculation
      assumes no current savings or debt. Income which is not saved
      is taken to be your cost of living. Change pre-FI and post-FI
      interest rates separately to account for change in risk tolerance
      (for example if you plan to live solely on interest post-FI,
      your risk tolerance would likely decrease)."),
    textOutput('SavingsRate'),
    textOutput("YTR"),
    plotOutput('TPlot')
    )
  )
)