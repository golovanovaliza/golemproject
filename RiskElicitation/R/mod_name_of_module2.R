#' name_of_module2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_name_of_module2_ui <- function(id){
  ns <- NS(id)
  tagList(
    h4("Distribution de CRRA par gender"),
    plotOutput(ns("plotOne"))

  )
}

#' name_of_module2 Server Functions
#'
#' @noRd
mod_name_of_module2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$plotOne <- renderPlot({
    library(tidyverse)
    library(ggplot2) # Load
    df <- read.csv('formatted_dataset.csv')

    df <- df %>% ggplot(aes(x = r, color = as.factor(gender))) +
      geom_histogram() +
      theme(legend.position="top")
      print(df)
    })
  })
}

## To be copied in the UI
# mod_name_of_module2_ui("name_of_module2_1")

## To be copied in the server
# mod_name_of_module2_server("name_of_module2_1")
