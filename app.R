library(shiny)
library(tidymodels)

# Load your trained workflow model
log_fit <- readRDS("../Build-deploy-stroke-prediction-model-R/log_fit.rds")

# Define UI
ui <- fluidPage(
  titlePanel("Stroke Prediction"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Gender", "Gender", choices = c("Male", "Female", "Other")),
      numericInput("Age", "Age", value = 50, min = 0, max = 120),
      selectInput("Hypertension", "Hypertension", choices = c(0,1)),
      selectInput("Heart_disease", "Heart Disease", choices = c(0,1)),
      selectInput("Ever_married", "Ever Married?", choices = c("Yes","No")),
      selectInput("Work_type", "Work Type", choices = c("Private","Self-employed","Govt_job","Children","Never_worked")),
      selectInput("Residence_type", "Residence Type", choices = c("Urban","Rural")),
      numericInput("Avg_glucose_level", "Average Glucose Level", value = 100),
      numericInput("BMI", "BMI", value = 25),
      selectInput("Smoking_status", "Smoking Status", choices = c("never smoked","formerly smoked","smokes","Unknown")),
      actionButton("predict_btn", "Predict Stroke")
    ),
    mainPanel(
      h3("Prediction Result:"),
      verbatimTextOutput("result")
    )
  )
)

# Define server
server <- function(input, output) {
  
  observeEvent(input$predict_btn, {
    
    # Create a new data frame safely with correct factor levels
    new_data <- data.frame(
      gender = factor(input$Gender, levels = c("Male","Female","Other")),
      age = as.numeric(input$Age),
      hypertension = as.numeric(input$Hypertension),
      heart_disease = as.numeric(input$Heart_disease),
      ever_married = factor(input$Ever_married, levels = c("Yes","No")),
      work_type = factor(input$Work_type, levels = c("Private","Self-employed","Govt_job","Children","Never_worked")),
      Residence_type = factor(input$Residence_type, levels = c("Urban","Rural")),
      avg_glucose_level = as.numeric(input$Avg_glucose_level),
      bmi = as.numeric(input$BMI),
      smoking_status = factor(input$Smoking_status, levels = c("never smoked","formerly smoked","smokes","Unknown"))
    )
    
    
    # Make prediction safely using log_fit
    result <- tryCatch({
      predict(log_fit, new_data, type = "prob")
    }, error = function(e) {
      paste("Error in prediction:", e$message)
    })
    
    
    # Show result
    output$result <- renderPrint({
      result
    })
    
  })
  
}

# Run the app
shinyApp(ui = ui, server = server)
