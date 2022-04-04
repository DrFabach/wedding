#' tab_covid UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_covid_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
 
    tags$div(class="landing-wrapper",
             
             # Image fond d'écran
             # tags$div(class = "landing-block background-content",
             #          
             #          img(src = glue::glue("www/", Sys.getenv("IMG_BACKGROUND")))
             #          
             # ),
             
             # Texte
             # tags$div(class = "landing-block foreground-content",
                      tags$div(class = "foreground-text",
                               br(),
                               tags$p("Mesdames", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Le sol du château est meuble, nous vous conseillons de prévoir des chaussures adaptées !",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Cérémonie laïque", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Nous organisons une cérémonie laïque pour laquelle nous serions ravis que vous participiez si vous le souhaitez.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Cela peut être des lectures de textes, des discours, des chansons ou toutes autres envies qui vous passeraient par la tête !",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Thème du mariage", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Vous l'avez constaté, nous avons choisi l'univers du cinéma comme thème de notre mariage.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Nous serions enchantés de découvrir un détail de votre style vestimentaire nous rappelant un de vos films préférés !",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                     
                               tags$p("Liste de mariage", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Pour notre mariage pas de liste..., mais un voyage ! ",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Un tronc sera disponible le jour du mariage.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               tags$p("Garde d'enfants", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Un baby-sitting sera organisé !",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center")
               
                               
                      
             )
    )
    
  )
  
}
    
#' tab_covid Server Functions
#'
#' @noRd 
mod_tab_covid_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_covid_ui("onglet_covid_ui_1")
    
## To be copied in the server
# mod_tab_covid_server("onglet_covid_ui_1")
