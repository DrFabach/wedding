#' tab_accommodation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom tibble tibble
mod_tab_accommodation_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
    
    leafletOutput(
      outputId = ns("carte_hebergements")
    ),
    
    tags$br(style = "line-height: 80px"),
    
    fluidRow(
      
      column(
        width = 4, 
        tags$p("Airbnb", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 25px; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 20px"),
        tags$p(
        tags$a("Lien internet", href = "https://www.airbnb.fr/s/Lichtenberg--France/homes?adults=1&place_id=ChIJGWDCYIqclkcRZEUjJULZoqU&refinement_paths%5B%5D=%2Fhomes&checkin=2022-06-11&checkout=2022-06-12", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center;"),
         style = " text-align: center"),
      
        tags$br(style = "line-height: 20px")
        ),
      
      column(
        width = 4,
        align = "center",
        tags$p("Gîte De Groupe", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 25px; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 20px"),
        tags$p("\u00c0 0 km, 0 minute", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 20px"),
        tags$a("Site internet", href = "https://tourisme.hanau-lapetitepierre.alsace/fiche/hebergements-collectifs/gite-de-groupe-2/", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center;"),
        tags$br(style = "line-height: 20px"),
        tags$p("Nous contacter pour réserver cet hébergement (30€/personne).", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        
        tags$br(style = "line-height: 20px")
       ),
      
      column(
        width = 4, 
        tags$p("Hôtel la couronne", style = "font-family: \'Bauer Bodoni Std 1\'; font-size: 25px; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 20px"),
        tags$p("\u00c0 3 km, 5 minutes", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center"),
        tags$br(style = "line-height: 20px"),
        tags$p(
        tags$a("Site internet", href = "https://www.lacouronnebyk.fr/hotel", style = "font-family: \'MrsEavesItalic\'; letter-spacing:3px; text-align: center;"),
        style = " text-align: center"),
      
        tags$br(style = "line-height: 20px")
        
      )
    )

  )
}
    
#' tab_accommodation Server Functions
#'
#' @noRd 
mod_tab_accommodation_server <- function(id, r_global){
  
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
 
    data_hebergements <- tibble(
      name = c(
        "<b>Airbnb</b><br/>0 km 0 minutes", 
        "<b>Gîte De Groupe</b><br/>0 km 0 minutes", 
        "<b>Hôtel la couronne</b><br/>3 km 5 minutes"), 
      longitude = c(-1.7129955029636943, -1.73221750178322,  -1.7487624196891016),
      
    )
    
    output$carte_hebergements <- renderLeaflet({
      
      data_markers_accomodation <- tibble(
        longitude = c(7.4802988, 7.4769124,  7.4634425),
        latitude = c(48.92090044, 48.9221844, 48.9250781),
        name = c(
          "<b>Airbnb</b><br/>0 km 0 minutes", 
          "<b>Gîte De Groupe</b><br/>0 km 0 minutes", 
          "<b>Hôtel la couronne</b><br/>3 km 5 minutes")
      )
        
      get_map_wedding(
        data_markers = data_markers_accomodation,
        icon_markers = "home", 
        zoom = 12
      )

    })
    
  })
}
    
## To be copied in the UI
# mod_tab_accommodation_ui("tab_accommodation_ui_1")
    
## To be copied in the server
# mod_tab_accommodation_server("tab_accommodation_ui_1")
