shinyUI(fluidPage(
        titlePanel("How Much Fruit Do People Like YOU Consume?",),
        
        sidebarLayout(
                sidebarPanel(h4("Make your selections and click the 'Submit!' button"),
                             hr(),
                selectInput(inputId="income", 
                            label="Income:", 
                            choices = list("Low" = "low", 
                                           "Medium" = "mid", 
                                           "High" = "high")),
                radioButtons("gender", label = "Gender:",
                             choices = list("Male" = "male", 
                                            "Female" = "female")),
                selectInput(inputId="age", 
                            label="Age Range:", 
                            choices = list("2 through 11" = "2-11", 
                                           "12 through 19" = "12-19", 
                                           "20 through 39" = "20-39",
                                           "40 through 59" = "40-59",
                                           "60 and over" = "60")),
                selectInput(inputId="weight", 
                            label="Weight Status:", 
                            choices = list("Underweight" = "under", 
                                           "Healthy weight" = "healthy", 
                                           "Overweight" = "over",
                                           "Obese" = "obese")),
                selectInput(inputId="education", 
                            label="Education:", 
                            choices = list("Less than high school" = "less", 
                                           "High school" = "high school", 
                                           "College" = "college")),
                selectInput(inputId="race", 
                            label="Race/ethnicity:", 
                            choices = list("Black" = "black", 
                                           "White" = "white", 
                                           "Hispanic" = "hispanic",
                                           "Other" = "other")),
                actionButton(inputId="submit", label="Submit!")
                ),
                mainPanel(
                          h3("Average Fruit Consumption by Indicators"),
                          p("Documentation:",a(" About the Fruit Consumption App",
                                               href="aboutfile.html", target="_blank")),
                          hr(),
                          fluidRow(
                                  column(6,
                          p("Most people are aware that fruits are considered an important part of a healthy diet."),
                          p("Studies have shown, too, that fruit consumption varies according to different socio-economic indicators and personal factors."),
                          p("This application allows you to input indicators about your life, and see the average fruit consumption for people 'like you'!")),
                                column(6,
                                       img(src="fruitbasket.jpg"))),
                          
                          plotOutput("fruitPlot"),
                          br()
                )
        )
))