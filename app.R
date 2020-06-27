#Artemio Herrera
#aherre48
#STATS 385
#Beta Distribution Final Project

library(shiny)

ui <- fluidPage(
    headerPanel("Central Limit Theorem"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("alpha","Parameter Alpha (α):", value = 1, min=0, max=100, step= 0.1),
            sliderInput("beta","Parameter Beta (β):", value = 1 ,min=0, max=100, step= 0.1),
            sliderInput("n", "Number of samples:",value = 2,min = 1, max = 100),
            
            
        ),
        mainPanel(
            plotOutput("hist")
        )
    )
)

server <- function(input, output, session) {
    output$hist <- renderPlot({
        means <- replicate(1e4, mean(rbeta(shape1=input$alpha,shape2=input$beta,n=input$n)))
        hist(means, breaks = 20, main = 'Distribution of the Sample Means')
    }, res = 96)
}
shinyApp(ui, server)