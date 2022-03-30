#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom readr read_csv cols col_character col_integer
#' @import dplyr
#' @noRd
app_server <- function( input, output, session ) {
  if(T){
  # credentials <- data.frame(
  #   user = c("antoine","michele"), # mandatory
  #   password = c("fabacher","fabacher"), # mandatory
  #   admin = FALSE,
  #   stringsAsFactors = FALSE,
  #   id =c(1,2)
  # )
 
  # call the server part
  # check_credentials returns a function to authenticate users
   
  # Reactive values
  r_global <- reactiveValues()
  # Data on google drive
  googledrive::drive_auth(cache = ".secrets",
                          email = "thibautfabacher@gmail.com")
  # 
  temp_dir <- tempdir()
  
  # googledrive::drive_download("site_mariage/data_expenses", path = glue::glue(temp_dir, "/data_expenses.csv"), overwrite = TRUE)
  # data_expenses <- read_csv(glue::glue(temp_dir, "/data_expenses.csv"), locale = locale(decimal_mark = ","))
  # r_global$data_expenses <- data_expenses
  # 
  googledrive::drive_download("site_mariage/donnee_ivite", path = glue::glue(temp_dir, "/data_guests.csv"), overwrite = TRUE)
  data_guests <- read_csv(glue::glue(temp_dir, "/data_guests.csv"), 
                          locale = locale(decimal_mark = ","),
                            col_types = cols(repas = col_logical(),
                                             tout = col_logical(),
                                           .default = col_character()))
  r_global$data_guests <- data_guests

  my_custom_check_creds <- function(dbname, db_user) {
    
    # finally one function of user and password
    # print("essai login1")
    function(user, password) {
      print(str(password))
      user<- user%>%tolower%>%
       gsub(" ","",.)%>%
       gsub("-","",.)%>%
      gsub("[éèêe]","e",.)%>%
       gsub("à","a",.)%>%
        gsub("ô","o",.)%>%
        gsub("ù","u",.)%>%
        gsub("ç","c",.)
      password<- password%>%tolower%>%
        gsub(" ","",.)%>%
        gsub("-","",.)%>%
        gsub("[éèêe]","e",.)%>%
        gsub("à","a",.)%>%
        gsub("ô","o",.)%>%
        gsub("ù","u",.)%>%
        gsub("ç","c",.)
      
      res<-data_guests%>%mutate(prenom=prenom%>%tolower%>%
                                  gsub(" ","",.)%>%
                                  gsub("-","",.)%>%
                                  gsub("[éèêe]","e",.)%>%
                                  gsub("à","a",.)%>%
                                  gsub("ô","o",.)%>%
                                  gsub("ù","u",.)%>%
                                  gsub("ç","c",.))%>%
        mutate(nom=nom%>%tolower%>%
                 gsub(" ","",.)%>%
                 gsub("-","",.)%>%
                 gsub("[éèêe]","e",.)%>%
                 gsub("à","a",.)%>%
                 gsub("ô","o",.)%>%
                 gsub("ù","u",.)%>%
                 gsub("ç","c",.))%>%
        filter(prenom==user,
               nom==password)

      if (nrow(res) > 0) {
        list(result = TRUE, user_info = list(user = user, id = res$id))
      } else {
        list(result = FALSE)
      }
  }
  }
  
  res_auth <- shinymanager::secure_server(
    check_credentials = my_custom_check_creds(dbname="user", db_user="password"),
    keep_token = T
  )
  
  output$auth_output <- renderPrint({
    
    reactiveValuesToList(res_auth)
  })
  }
  googledrive::drive_download("site_mariage/new_data_guests_reponse.csv", path = glue::glue(temp_dir, "/data_guests_2.csv"), overwrite = TRUE)
  data_guests_2 <- read_csv(glue::glue(temp_dir, "/data_guests_2.csv"), 
                          locale = locale(decimal_mark = ","),
                          col_types = cols(.default = col_character()))
  r_global$data_guests_2<-data_guests_2
  r_global$donnee_utilisateur<-reactive({
    id_i<-res_auth$id
    id_i<-ifelse(length(id_i)==0,0,id_i)
    
    data_guests%>%filter(id == id_i)})
 r_global$partie<- reactive({
   data_i<-r_global$donnee_utilisateur()
   data_i<-data_i%>%slice(1)
   ifelse(data_i$tout,"tout",ifelse(data_i$repas,"repas","apero"))
 })
  # r_global$donnee_utilisateur<- tibble(prenom= c("Antoine","Michele"),
  #                                      sexe = c("H","F"),
  #                                      enfants=0,
  #                                      repas =T
  # )
  # Your application server logic 
  mod_tab_couple_server("tab_couple_ui_1", r_global = r_global)
  mod_tab_confirmation_server("tab_confirmation_ui_1", r_global = r_global)
  mod_tab_schedule_server("tab_schedule_ui_1", r_global = r_global)
  mod_tab_witnesses_server("tab_witnesses_ui_1", r_global = r_global)
  
  mod_tab_accommodation_server("tab_accommodation_ui_1", r_global = r_global)
  mod_tab_covid_server("tab_covid_ui_1", r_global = r_global)
  
  observeEvent(r_global$donnee_utilisateur,ignoreInit = F,({
    print(r_global$donnee_utilisateur()$repas[1])
    mod_tab_place_server("tab_place_ui_1", r_global = r_global)
  # mod_hidden_tab_preparations_server("hidden_tab_preparations_ui_1", r_global = r_global)
 } ))
}
