#' tab_schedule UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_schedule_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
 
    tags$div(class = "landing-block foreground-content",
             tags$div(class = "foreground-text",
                      tags$br(style = "line-height: 80px"),
                      tags$p("Benediction", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                      tags$p("11 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("Paulus chapelle\nEn petit comit\u00e9 | Seuls les t\u00e9moins, parents, fr\u00e8res & soeurs sont convi\u00e9s", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$br(style = "line-height: 80px"),
                      tags$p("Mairie", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                      tags$p("12 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("En petit comit\u00e9 ", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$br(style = "line-height: 80px"),
                      tags$p("C\u00e9r\u00e9monie la\u00efque", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                      tags$p("15 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("Château du Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$br(style = "line-height: 80px"),
                      tags$p("Vin d\'honneur", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                      tags$p("17 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("Château du Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$br(style = "line-height: 80px"),
                      tags$p("D\u00eener", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                      tags$p("19 heures 30", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("Lichtenbert", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$br(style = "line-height: 80px"),
                     tags$p("11 heures 30 le lendemain", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                      tags$p("1 rue d'Alsace Meisenthal", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center")
             )
    )
    
  )
}
    
#' tab_schedule Server Functions
#'
#' @noRd 
mod_tab_schedule_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_schedule_ui("tab_schedule_ui_1")
    
## To be copied in the server
# mod_tab_schedule_server("tab_schedule_ui_1")
