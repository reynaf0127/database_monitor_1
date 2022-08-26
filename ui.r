ui = fluidPage(
  tagList(
    tags$style(HTML("
      .shiny-output-error-validation {
        color: #ff0000;
        font-weight: bold;
      }
    ")),
    navbarPage(
      theme = shinythemes::shinytheme("superhero"),
      "Wimo Database Monitor",
      tabPanel("Data Quality Monitor",
               sidebarPanel(
                 h5("Select Date:"),
                 sliderInput("date_range",
                             min = as.Date("2022-01-18","%Y-%m-%d"),
                             max = as.Date(Sys.Date(),"%Y-%m-%d"),
                             value=as.Date(Sys.Date()-7),
                             timeFormat="%Y-%m-%d"),
                 radioButtons("database","Please select database:",
                              choices = list("Vertica","NomNomDatabase"),
                              selected = "Vertica"),
                 width = 3,
                 style = "font-size:75%"
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Daily Traffic"
                            # helpText('This is campaign and ad network builder. Update value on the table untill non cells are red and click Save. After updating all input values, restart the tool to refresh result.'),
                            # helpText('Right click can add/delete a row.'),
                            # helpText('Only support Android/iOS. Please contact developer if need other platforms.'),
                            # h3("Marketing Budget Plan"),
                            # rHandsontableOutput("campaign_builder"),
                            # helpText("Please save Budget Plan table first then refresh the page to update data validation for all tables below."),
                            # textOutput("campaign_builder_validation"),
                            # br(),
                            # actionButton("save_campaign_builder", "Save Marketing Budget",icon("save"))
                   ),
                   tabPanel("Database Comparison" 
                            # h3("Retention"),
                            # rHandsontableOutput("retention_variables"),
                            # textOutput("retention_variables_validation"),
                            # br(),
                            # actionButton("save_retention_variables", "Save Retention Variables",icon("save")),
                            # br(),
                            # br(),
                            # br(),
                            # h3("Organic Installs"),
                            # rHandsontableOutput("input_variables"),
                            # textOutput("input_variables_validation"),
                            # br(),
                            # actionButton("save_input", "Save Input Variables",icon("save"))
                   )
                 ),
                 width = 9,
                 style = "font-size:80%"
               )
      ),
      tabPanel("KPI Result",
               sidebarPanel(
                 # helpText("Select Month/Daily view to download"),
                 # radioButtons("download_data_select", 
                 #              h5("Choose monthly/daily data:"), 
                 #              choices = list("Monthly", 
                 #                             "Daily"),
                 #              selected = "Monthly"),
                 # downloadButton("downloadRevenue", "Download"),
                 width = 3,
                 style = "font-size:75%"
               ),
               mainPanel(
                 h3("KPI Result"),
                 tabsetPanel(type = "tabs",
                             tabPanel("Vertica KPI",tableOutput("month_view")%>% withSpinner(type=4,color="#0dc5c1",size=1)),
                             tabPanel("NND KPI",reactableOutput("date_view")%>% withSpinner(type=4,color="#0dc5c1",size=1))
                 ),
                 width = 9,
                 style = "font-size:80%"
               )
      )
    )
  )
)