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
  fluidRow(
    
    column(
      
      width = 6,   uiOutput(ns("programme"))),
    column(3,tags$div(img(src = "www/camera.png"), style = "text-align: center; width = 50%"),
    ))

}
    
#' tab_schedule Server Functions
#'
#' @noRd 
mod_tab_schedule_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
    observeEvent(r_global$partie,ignoreInit = F,{
      partie<-r_global$partie()
      print(partie)
      output$programme <- renderUI({ 
        
        debut<-tagList(tags$p("Bénédiction", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                       tags$p("11 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$p("Paulus chapelle", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$br(style = "line-height: 80px"),
                       
                       tags$p("Mairie", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                       tags$p("12 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$p("Meisenthal", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$br(style = "line-height: 80px"))
        milieu<-
          tagList(tags$p("C\u00e9r\u00e9monie la\u00efque", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
        tags$p("15 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        tags$p("Château de Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 80px"),
        tags$p("Vin d\'honneur", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
        tags$p("17 heures", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        tags$p("Château de Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"))
        fin <- tagList(tags$br(style = "line-height: 80px"),
                       tags$p("D\u00eener", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                       tags$p("19 heures 30", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$p("Salle des fêtes de Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$br(style = "line-height: 80px"),
                       tags$p("Brunch", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:5px; text-align: center"),
                       tags$p("10 heures 30 le lendemain", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                       tags$p("Salle des fêtes  de Lichtenberg", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"))
        if(partie =="tout"){
          return(tagList(
            
            tags$div(class = "landing-block foreground-content",
                     tags$div(class = "foreground-text",
                              tags$br(style = "line-height: 80px"),
                              debut,
                              milieu,
                              fin))
          )
          )
        }else if(partie =="repas"){
          return(tagList(
            
            tags$div(class = "landing-block foreground-content",
                     tags$div(class = "foreground-text",
                              tags$br(style = "line-height: 80px"),
                            
                              milieu,
                              fin))
          )
          )
        }else{
         return(tagList(
           
           tags$div(class = "landing-block foreground-content",
                    tags$div(class = "foreground-text",
                             tags$br(style = "line-height: 80px"),
                    milieu))
         )
         )
        }
        
        
        
        
        
    })
  })
})}

## To be copied in the UI
# mod_tab_schedule_ui("tab_schedule_ui_1")
    
## To be copied in the server
# mod_tab_schedule_server("tab_schedule_ui_1")
