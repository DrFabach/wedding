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
                               tags$p("Mesdames", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Le sol du château est meuble, nous vous conseillons de prévoir des chaussures adaptées",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Cérémonie laique", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Nous organisons une cérémonie laïque pour laquelle nous serions ravies que vous participiez si vous le souhaitez.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Cela peut être des lectures de textes, des discours, des chansons ou toute autres envies qui vous passeraient par la tête",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Thèmes du mariage", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Vous l'avez sans aucun doute constaté, nous avons choisis l'univers du cinéma comme thème de notre mariage.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Nous serions enchanté de découvrir un détail de votre look vestimentaire nous rapellant un de vos films préférés",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                     
                               tags$p("Liste de mariage", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Pour notre mariage...pas de liste, mais...un voyage ! ",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Une urne sera disponible le jour du mariage.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               tags$p("Baby-sitting", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Un baby-sitting sera organisé pour la durée de l'évenement",
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
