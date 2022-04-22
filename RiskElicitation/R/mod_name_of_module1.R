#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_name_of_module1_ui <- function(id){
  ns <- NS(id)
  tagList(
    h4("Distribution de CRRA par task"),
    plotOutput(ns("plotOne"))
)}

#' name_of_module1 Server Functions
#'
#' @noRd
mod_name_of_module1_server <- function(id){
 moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$plotOne <- renderPlot({
    library(tidyverse)
    library(ggplot2) # Load
    df <- read.csv('formatted_dataset.csv')
    df <- df %>% ggplot(aes(x = r, color = task)) +
      geom_histogram() +
      theme(legend.position="top")
    print(df)
    })
   })
}


## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_1")

## To be copied in the server
# mod_name_of_module1_server("name_of_module1_1")
