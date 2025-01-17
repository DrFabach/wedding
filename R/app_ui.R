#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  
  tagList(
    
    # Leave this function for adding external resources
    golem_add_external_resources(),
    tags$html(lang="fr"),
    # Your application UI logic 
    navbarPage(title = NULL,
               
               tabPanel(
                 title = "Accueil",
                 mod_tab_couple_ui("tab_couple_ui_1")
               ),
               tabPanel(
                 title = "Lieu du mariage",
                 mod_tab_place_ui("tab_place_ui_1")
               ),
               tabPanel(
                 title = "Programme de la journ\u00e9e",
                 mod_tab_schedule_ui("tab_schedule_ui_1")
               ),
               tabPanel(
                 title = "Informations importantes",
                 mod_tab_covid_ui("tab_covid_ui_1")
               ),  
               
               tabPanel(
                 title = "Confirmer ma venue", 
                   mod_tab_confirmation_ui("tab_confirmation_ui_1"
                   )
               ),
             
               
               
               
               tabPanel(
                 title = "H\u00e9bergements",
                 mod_tab_accommodation_ui("tab_accommodation_ui_1")
               ),
               
               tabPanel(
                 title = "Contact",
                 mod_tab_witnesses_ui("tab_witnesses_ui_1")
               )
               # 
              
               
               # tabPanel(
               #   title = "Espace des mari\u00e9s",
               #   mod_hidden_tab_preparations_ui("hidden_tab_preparations_ui_1")
               # )
               
               )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @importFrom shinymanager set_labels
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  set_labels(
    language = "en",
    "Please authenticate" = "Site du Mariage de Barbara & Thibaut",
    "Username:" = "Prénom",
    "Password:" = "Nom de famille",
    "Login" = "Connexion",
    "Username or password are incorrect" = "L\'identifiant ou le mot de passe est incorrect"
  )
 
  tags$head(
    tags$html(lang="fr"),
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'wedding',
    ),
    tags$link(href = "www/custom_app_style.css", rel = "stylesheet", type = "text/css"),
    tags$link(href = "www/custom_logging_style.css", rel = "stylesheet", type = "text/css")
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

