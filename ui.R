
library(shiny)

shinyUI(fluidPage(
  titlePanel("Housing Loan Calculator"),
  sidebarLayout(
    sidebarPanel(
      helpText("This housing loan calculator app can computes monthly, quarterly and yearly payment 
               based on your inputs."),            
      br(),            
      numericInput("Housing_loan_amt",
                   label = h6("Enter the housing loan amount (in $)"),
                   value = 1000),
      br(),            
      sliderInput("int_rate",
                  label = h6("Key in the interest rate (in %)"),
                  min = 0, max = 25, value = 7),
      
      br(),            
      sliderInput("time_period",
                  label = h6("Choose the housing loan duration"),
                  min = 0, max = 120, value = 7),
      selectInput("durtn",
                  label = h6(""),
                  choices = list("Years" = 1,
                                 "Quarters" = 2,
                                 "Months" =3),
                  selected = 1 
      ), 
      br(),
      br(),            
      actionButton("Calc", label = "Calculate!")        
      ),
    mainPanel(
      tabsetPanel(
        tabPanel("Output",
                 p(h5("Values you entered:")),
                 textOutput("text_Loan_amt"),
                 textOutput("text_int_rate"),
                 textOutput("text_time_period"),
                 textOutput("text_duration"),
                 br(),
                 p(h5("Calculated amount:")),
                 textOutput("text_intr"),
                 textOutput("text_amtplus"),
                 textOutput("text_mthpay")
        ),
        tabPanel("Documentation",
                 p(h4("Housing Loan Calculator:")),
                 br(),
                 helpText("This housing loan calculator application computes monthly payment of loan after sum up with interest"),
                    HTML("<u><b> Equation : </b></u>
                        <br> <br>
                        <b> A = P + I = P(1 + rt) ; R = r * 100 </b>
                        <br>
                        where: <br>
                        A = Total amount (Housing Loan + Interest) <br>
                        P = Loan amount <br>
                        I = Interest <br>
                        r = Interest rate per year, in decimal<br>
                        t = Duration in years/quarters/months
                    ")                
        )
      )
    )
  )
))