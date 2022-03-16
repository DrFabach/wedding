#' tab_witnesses UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_witnesses_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
 
    tags$br(style = "line-height: 20px"),
    
    fluidRow(
      
      column(
        
        width = 6, 
        
        align = "center",
        
        style = "border-right:1px solid",
        
        tags$p("Nous contacter :", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
        
        tags$br(style = "line-height: 20px"),
        
        tags$p("jacob@fabacher.fr"),
        
        tags$br(style = "line-height: 20px"),
        
       
      ), 
      
      column(
        
        width = 6, 
        
        align = "center",
        
        tags$p("Contacter les témoins :", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
        
        tags$br(style = "line-height: 20px"),
        tags$p("temoins_barbara@fabacher.fr"),
        
        tags$p("temoins_thibaut@fabacher.fr"),
        
        tags$br(style = "line-height: 20px"),
        
      )
    ),
    fluidRow(    align = "center",
                 
                 tags$p("Contacter le maître de cérémonie :", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                 
                 tags$br(style = "line-height: 20px"),
                 tags$p("ceremonie@fabacher.fr")
                 
              
  ))
}
    
#' tab_witnesses Server Functions
#'
#' @noRd 
mod_tab_witnesses_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_witnesses_ui("tab_witnesses_ui_1")
    
## To be copied in the server
# mod_tab_witnesses_server("tab_witnesses_ui_1")
