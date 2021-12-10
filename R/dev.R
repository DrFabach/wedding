library(shiny)
library(tibble)
library(shinyjs)
library(tidyverse)
source("R/app_server.R")
ui <- fluidPage(
 
 
    
      mod_tab_confirmation_ui("tab_confirmation_ui_1")
    
  
)

server <- function(input, output, session) {
  mod_tab_confirmation_server("tab_confirmation_ui_1", r_global = r_global)
  
}



shinyApp(ui, server)

