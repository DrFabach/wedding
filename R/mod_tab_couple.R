#' tab_couple UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shinyWidgets setBackgroundImage 
mod_tab_couple_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
   
    # parent container
    tags$div(class = "landing-wrapper",
             
             # Image fond d'écran
             tags$div(class = "landing-block background-content",
                      
                      img(src = glue::glue("www/", "1ere_page_comp.jpg"), width = '100%')
                      
             ),
             
             # Texte
             tags$div(class = "landing-block foreground-content",
                      tags$div(class = "foreground-text",
                               tags$h1("Barbara et Thibaut", style = "font-family: 'Bauer Bodoni Std 1'; letter-spacing:7px"),
                               tags$p("se disent oui", style = "font-family: 'Old script'; font-size:50px; letter-spacing:5px"),
                              
                               tags$p("11 Juin 2022", style = "font-family: 'Bauer Bodoni Std 1';font-size:25px; letter-spacing:6px")
                      )
             )
             
             # Décomptes
             
             # tags$div(class = "decompte_text",
             # 
             #   textOutput(
             #     outputId = ns("decompte_vie_commune")
             #   )
             #    
             # ),
             
             # tags$div(class = "decompte_text",
               # textOutput(
                 # outputId = ns("decompte_mariage")
               # )
             # )
    )
  )
  
}
    
#' tab_couple Server Functions
#'
#' @noRd 
mod_tab_couple_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
    
    output$decompte_vie_commune <- renderText({
      
      get_count_countdown_moments(start_moment = "2010-06-11 15:00:00",
                                  end_moment = lubridate::now(tzone = "Europe/Paris"),
                                  text = "depuis leur rencontre",
                                  time_zone = "Europe/Paris",
                                  language = "fr")
      
    })
    
    output$decompte_mariage <- renderText({

      get_count_countdown_moments(start_moment = lubridate::now(tzone = "Europe/Paris"),
                                  end_moment = "2022-06-11 15:00:00",
                                  text = "jusqu'au mariage",
                                  time_zone = "Europe/Paris",
                                  language = "fr")
    })
    
  })
}


# ui <- fluidPage(mod_tab_couple_ui(1))
# 
# server <- function(input, output, session) {
#   mod_tab_couple_server(1, r_global = r_global)
# }
# 
# shinyApp(ui, server)    
## To be copied in the UI
# mod_tab_couple_ui("tab_couple_ui_1")
    
## To be copied in the server
# mod_tab_couple_server("tab_couple_ui_1")
