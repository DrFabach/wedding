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
                               tags$p("Damen", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Der Boden des Schlosses ist locker. Wir empfehlen Ihnen, geeignetes Schuhwerk mitzubringen!",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Laizistische Zeremonie", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Wir organisieren eine laizistische Zeremonie, bei der wir uns freuen würden, wenn Sie sich beteiligen, wenn Sie es wünschen.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Das können Textlesungen, Reden, Lieder oder alle anderen Wünsche sein, die Ihnen in den Sinn kommen!",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               
                               tags$p("Thema der Hochzeit", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Wie Sie vielleicht schon bemerkt haben, haben wir die Welt des Kinos als Thema für unsere Hochzeit gewählt.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Wir würden uns freuen, wenn wir ein Detail in Ihrem Kleidungsstil entdecken könnten, das uns an einen Ihrer Lieblingsfilme erinnert!",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                     
                               tags$p("Hochzeitsliste", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Für unsere Hochzeit keine Liste..., sondern eine Reise!",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               tags$p("Ein Hochzeitsurne wird am Tag der Hochzeit zur Verfügung stehen.",
                                      style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
                               
                               tags$p("Kinderbetreuung", 
                                      style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
                               tags$p("Für die Dauer der Veranstaltung wird ein Babysitter organisiert!",
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
