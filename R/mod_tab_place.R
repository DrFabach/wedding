#' tab_place UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_place_ui <- function(id){
  
  ns <- NS(id)
  uiOutput(ns("place"))
  
}
    
#' tab_place Server Functions
#'
#' @noRd 
mod_tab_place_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
    
    output$carte_belle_Lichtenberg <- renderLeaflet({
      
      get_map_wedding(
        data_markers = tibble(
          longitude = c(7.487151646289885,7.481969), 
          latitude = c(48.921194828283234,48.921543),
          name = c('<a href="https://g.page/Chateaulichtenberg?share" target="_blank" rel="noopener noreferrer">Château Lichtenberg</a>',
                   '<a href="https://goo.gl/maps/FW6S6ReUpMuZidq76" target="_blank" rel="noopener noreferrer">Parking</a>')),
        icon_markers = c("heart","car-sport"),
        zoom = 8
      )
                            
    })
 
    output$place <- renderUI({ 
    tagList(
      
      tags$br(style = "line-height: 80px"),
      
      fluidRow(
        
        align = "center",
          tags$div(img(src = "www/bellenoe.jpg", width="100%"), style = "text-align: center; width = 50%"),
          tags$br(style = "line-height: 20px"),
          tags$p("Château de Lichtenberg", style = "font-family: \'Bauer Bodoni Std 1\'; letter-spacing:3px; text-align: center")),
      tags$br(style = "line-height: 80px"),
     fluidRow(
     
          align = "center",
          leafletOutput(
            outputId = ns("carte_belle_Lichtenberg"),
            height = 341,
            width = 512
          )
        
      ),
      
      # Parking
      tags$br(style = "line-height: 80px"),
      
      tags$p("L'accès au château se fait à pied, le parking se situe au milieu du village sur la place de l'église. (nous contacter en cas de mobilité réduite).", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      
      tags$br(style = "line-height: 80px"),
    fluidRow( align = "center", HTML('<iframe src="https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d2621.6804203796464!2d7.482705715855153!3d48.921480704216144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e2!4m4!1s0x47969dfa815b010b%3A0xabafe904b998cccc!3m2!1d48.9217048!2d7.481438!4m5!1s0x47969c884b29bae5%3A0x96529b46d62b91e3!2sCh%C3%A2teau%20de%20Lichtenberg%2C%20Rue%20des%20Cochers%2C%2067340%20Lichtenberg!3m2!1d48.921158899999995!2d7.4864538!5e0!3m2!1sen!2sfr!4v1648657427424!5m2!1sen!2sfr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
    )
      # Hébergements
      # fluidRow(
      #   
      #   column(
      #     width = 6,
      #     tags$br(style = "line-height: 45px"),
      #     tags$p("Les h\u00e9bergements sur place", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
      #     tags$p("Le domaine a une capacit\u00e9 d\u2019h\u00e9bergements de 40/42 personnes.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("Les h\u00e9bergements sont compos\u00e9s de 5 chambres d\'h\u00f4tes,", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("de petites chambres dans les d\u00e9pendances, et de 2 g\u00eetes.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("Vous trouverez plus d\'informations dans l\'onglet H\u00e9bergements.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("Le tarif sera de 25 euros/nuit/personne pour une h\u00e9bergement sur place.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("La priorit\u00e9 sera donn\u00e9e \u00e0 nos copains qui picolent beaucoup (ah ah) et aux familles.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("Un espace camping avec toilettes s\u00e8ches est \u00e9galement disponible.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center")
      #   ),
      #   
      #   column(
      #     width = 6,
      #     tags$div(img(src = "www/bellenoe_dortoir.jpg"), 
      #              style = "text-align: center"),
      #   )
      #   
      # ),
      # 
      # tags$br(style = "line-height: 80px"),
      # 
      # # Salon des enfants
      # fluidRow(
      #   
      #   column(
      #     width = 6,
      #     tags$div(img(src = "www/bellenoe_enfants.jpg"), 
      #              style = "text-align: center"),
      #   ),
      #   
      #   column(
      #     width = 6,
      #     tags$br(style = "line-height: 120px"),
      #     tags$p("Le salon des enfants", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 30px; letter-spacing:3px; text-align: center"),
      #     tags$p("Petite d\u00e9pendance de 45m\u00b2 proche des salles de r\u00e9ception et", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("\u00e9quip\u00e9e pour y recevoir les enfants sous la surveillance de baby-sitters.", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
      #     tags$p("Au premier \u00e9tage, un petit dortoir \u00e9quip\u00e9 de 8 lits (une personne).", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center")      )
      #   
      # )
      
    )
    })
  })
}
    
## To be copied in the UI
# mod_tab_place_ui("tab_place_ui_1")
    
## To be copied in the server
# mod_tab_place_server("tab_place_ui_1")
