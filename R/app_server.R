#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom readr read_csv cols col_character col_integer
#' 
#' @noRd
app_server <- function( input, output, session ) {
  if(T){
  credentials <- data.frame(
    user = c("antoine","michele"), # mandatory
    password = c("fabacher","fabacher"), # mandatory
    admin = FALSE,
    stringsAsFactors = FALSE,
    id =c(1,2)
  )
 
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- shinymanager::secure_server(
    check_credentials = shinymanager::check_credentials(credentials),
  keep_token = T
  )
  
  output$auth_output <- renderPrint({
    print(res_auth$user_info)
    print(res_auth())
    reactiveValuesToList(res_auth)
  })
  }
  # Reactive values
  r_global <- reactiveValues()
  r_global$print<-(res_auth)
  # Data on google drive
  googledrive::drive_auth(cache = ".secrets",
                          email = Sys.getenv("GOOGLE_MAIL"))
  
  temp_dir <- tempdir()
  
  googledrive::drive_download("site_mariage/data_expenses", path = glue::glue(temp_dir, "/data_expenses.csv"), overwrite = TRUE)
  data_expenses <- read_csv(glue::glue(temp_dir, "/data_expenses.csv"), locale = locale(decimal_mark = ","))
  r_global$data_expenses <- data_expenses
  
  googledrive::drive_download("site_mariage/donnee_ivite", path = glue::glue(temp_dir, "/data_guests.csv"), overwrite = TRUE)
  data_guests <- read_csv(glue::glue(temp_dir, "/data_guests.csv"), 
                          locale = locale(decimal_mark = ","),
                          col_types = cols(table = col_integer(),
                                           .default = col_character()))
  r_global$data_guests <- data_guests
  
  googledrive::drive_download("site_mariage/new_data_guests_reponse.csv", path = glue::glue(temp_dir, "/data_guests_2.csv"), overwrite = TRUE)
  data_guests_2 <- read_csv(glue::glue(temp_dir, "/data_guests_2.csv"), 
                          locale = locale(decimal_mark = ","),
                          col_types = cols(.default = col_character()))
  r_global$data_guests_2<-data_guests_2
  
  r_global$donnee_utilisateur<- tibble(prenom= c("Antoine","Michele"),
                                       sexe = c("H","F"),
                                       enfants=0,
                                       repas =T
  )
  # Your application server logic 
  mod_tab_couple_server("tab_couple_ui_1", r_global = r_global)
  mod_tab_confirmation_server("tab_confirmation_ui_1", r_global = r_global,donnee_utilisateur = donnee_utilisateur)
  mod_tab_schedule_server("tab_schedule_ui_1", r_global = r_global)
  mod_tab_place_server("tab_place_ui_1", r_global = r_global)
  mod_tab_accommodation_server("tab_accommodation_ui_1", r_global = r_global)
  mod_tab_covid_server("tab_covid_ui_1", r_global = r_global)
  mod_tab_witnesses_server("tab_witnesses_ui_1", r_global = r_global)
  mod_hidden_tab_preparations_server("hidden_tab_preparations_ui_1", r_global = r_global)
  
}
