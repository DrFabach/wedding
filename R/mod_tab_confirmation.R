#' tab_confirmation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @importFrom readr read_csv locale
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom shinyjs useShinyjs
mod_tab_confirmation_ui <- function(id) {
  ns <- NS(id)
  tagList(
    useShinyjs(),
    fluidRow(align = "center",
             img(
               src = glue::glue("www/", "confirmation-2.jpg")
             )),
    fluidRow(
      align = "center",
      tags$br(style = "line-height: 65px"),
      h1("Confirmation venue", style = "font-family: \'Bauer Bodoni Std 1\'; font-size:30px; letter-spacing:5px; color: black; text-align: center"),      tags$br(style = "line-height: 40px"),
    ),
    uiOutput(ns("confirmation")),
    fluidRow(align="center",
             uiOutput(ns("enfant")),
             htmltools::tagAppendAttributes(
             shinyWidgets::materialSwitch(
               inputId = ns("ceremonie"),
               label = "Souhaitons participer activement à la cérémonie",
               value = F,
               status = "success",
               right = TRUE
             ) ,  style = "text-align: initial;"
             )),
    fluidRow(align="center",
             
          
            shinyWidgets::actionBttn(
               inputId = ns("save_info_guest"),
               label = "Enregistrer mes choix",
               style = "unite", 
               color = "danger"
             )
             
    )
   
  )
  
}

#' tab_confirmation Server Functions
#'
#' @importFrom shinyjs reset hide
#' @importFrom tibble add_row
#' @importFrom dplyr top_n distinct pull filter left_join arrange bind_rows group_by
#' @importFrom purrr map_dfr
#'
#' @noRd
mod_tab_confirmation_server <-
  function(id, r_global) {
    moduleServer(id, function(input, output, session) {
      
      ns <- session$ns
      BDD<-reactive(r_global$donnee_utilisateur())
      observeEvent(BDD,{
        print(r_global$donnee_utilisateur())
        print(BDD)
        data<-BDD()
      
      
      nb_enfants<- (data$enfants[1])
        nb_invite <- (dim(data)[1])
        prenom_femme <-(
          ifelse(
            any(data$sexe == "F"),
            data %>% filter(sexe == "F") %>% pull(prenom),
            NA
          ))
        prenom_homme <-(
          ifelse(
            any(data$sexe == "H"),
            data %>% filter(sexe == "H") %>% pull(prenom),
            NA
          ))
        repas<- (any(data$repas))
        # if(!repas)  shinyjs::hide(id = "here_dinner")
       
        ui_invite<- renderUI({ tags$div(
        
          column(
            3,
            img(src = glue::glue("www/", ifelse(
              is.na(prenom_femme),
              "elle.png", "lui.png")))),
          column(
            9,
      
          br(),
          textInput(
            inputId = ns("name_2"),
            label = "Prénom",
            value = ifelse(nb_invite ==1 , "",ifelse(!is.na(prenom_femme),prenom_homme, prenom_femme
            )),
          ),
          tags$br(style = "line-height: 20px"),
          tags$p(
            "Pr\u00e9sence aux diff\u00e9rents moments du mariage",
            style = "font-size:15px; letter-spacing:3px; font-weight: bold; color: black"
          ),
          br(),
          shinyWidgets::materialSwitch(
            inputId = ns("here_cocktail_2"),
            label = "Vin d'honneur",
            value = F,
            status = "success",
            right = TRUE
          ),
       
          shinyWidgets::materialSwitch(
            inputId = ns("here_dinner_2"),
            label = "Repas",
            value = F,
            status = "success",
            right = TRUE
          ),
          shinyWidgets::materialSwitch(
            inputId = ns("here_brunch_2"),
            label = "Brunch du dimanche",
            value = F,
            status = "success",
            right = TRUE
          ),
          tags$br(style = "line-height: 20px"),
          textInput(
            inputId = ns("special_diet_2"),
            label = "R\u00e9gime alimentaire particulier ",
            placeholder = "allergies/intol\u00e9rances alimentaires, r\u00e9gime femme enceinte, etc."
          ),
          textInput(
            inputId = ns("film_2"),
            label = "Film préféré",
            placeholder = "Indiquer le meilleur film de tous les temps"
          
        )))
        })
  
        if(nb_enfants >0){
          output$enfant <- renderUI({
            
            htmltools::tagAppendAttributes(
       
            shinyWidgets::materialSwitch(
              inputId = ns("enfant_1"),
              label = "Je viens avec mes enfants", 
              value = TRUE,
              right = TRUE,
              status = "success"
            ) ,  style = "text-align: initial;")
            
            
          })
        }
        if (nb_invite==1) {

                  output$quest_invite_supp <- renderUI({

                    tags$div(
                   
                      shinyWidgets::materialSwitch(
                        inputId = ns("accompagne"),
                        label = "Je viens accompagné(e)",
                        value = F,
                        status = "success",
                        right = TRUE
                      ))
                  })
                  

                  observeEvent(input$accompagne, ignoreInit = TRUE, {
                    print(r_global$print$id )
                    if(input$accompagne){
                      output$invite_supp<-ui_invite
                    }else{
                      output$invite_supp<-NULL
                    
                    }
                    
                    
                  })

        }else{
                  
        output$invite_supp<-ui_invite
        shinyjs::hide(id = "quest_invite_supp")
                } 
       

        
        output$confirmation <- renderUI({
          
         fluidPage( column(
            6,
            align = "left",
            column(
              3,
            img(src = glue::glue("www/", ifelse(
              !is.na(prenom_femme),
              "elle.png", "lui.png")))),
            column(
                9,
          
              br(),
              textInput(
                inputId = ns("name"),
                label = "Prénom",
                value = ifelse(is.na(prenom_femme),prenom_homme, prenom_femme
                ),
              ),
              tags$br(style = "line-height: 20px"),
              tags$p(
                "Pr\u00e9sence aux diff\u00e9rents moments du mariage",
                style = "font-size:15px; letter-spacing:3px; font-weight: bold; color: black"
              ),
              br(),
              shinyWidgets::materialSwitch(
                inputId = ns("here_cocktail"),
                label = "Vin d'honneur",
                value = F,
                status = "success",
                right = TRUE
              ),
           
              shinyWidgets::materialSwitch(
                inputId = ns("here_dinner"),
                label = "Repas",
                value = F,
                status = "success",
                right = TRUE
              ),
              shinyWidgets::materialSwitch(
                inputId = ns("here_brunch"),
                label = "Brunch du dimanche",
                value = F,
                status = "success",
                right = TRUE
              ),
            tags$br(style = "line-height: 20px"),
            textInput(
              inputId = ns("special_diet"),
              label = "R\u00e9gime alimentaire particulier",
              placeholder = "allergies/intol\u00e9rances alimentaires, r\u00e9gime femme enceinte, etc."
            ),
            textInput(
              inputId = ns("film"),
              label = "Film préféré",
              placeholder = "Indiquer le meilleur film de tous les temps"
            )
            )),
          
            
          column(
            6,
            align = "left",
          
            uiOutput(ns("quest_invite_supp")),
            uiOutput(ns("invite_supp")) # ui3
            
            
          )  
         )
        
        })
   
        })
    # Local reactive values - stay in the module
    r_local <- reactiveValues()
    
    r_local$info <- tibble(
      prenom = character(),
      nom = character(),
      here_cocktail  = character(),
      here_dinner = character(),
      here_brunch = character(),
      enfant=character(),
      special_diet  = character(),
      film =   character(),
      ceremonie= character(),
      date= character()
      )
  
    observeEvent(input$save_info_guest, {
      r_local$name <- c(input$name,input$name_2)%>%as.character()
      r_local$here_cocktail= c(input$here_cocktail,input$here_cocktail_2)%>%as.character() 
            r_local$here_dinner = c(input$here_dinner,input$here_dinner_2)%>%as.character()
            r_local$here_brunch =c(input$here_brunch,input$here_brunch_2)%>%as.character()
            r_local$special_diet=  c(input$special_diet,input$special_diet_2)%>%as.character()
            r_local$film =   c(input$film, input$film_2)%>%as.character()
            r_local$enfant =   input$enfant_1%>%as.character()
            r_local$ceremonie = input$ceremonie%>%as.character()
            r_local$date = Sys.time()%>%as.character()
            
      r_local$info<-r_local$info%>%add_row(
      prenom= r_local$name,
      nom =  (data$nom[1]),
      here_cocktail= r_local$here_cocktail,
      here_dinner = r_local$here_dinner ,
      here_brunch =r_local$here_brunch,
      special_diet=  r_local$special_diet,
      film =   r_local$film ,
      enfant =   r_local$enfant,
      ceremonie =r_local$ceremonie,
      date = r_local$date
      )
      print(data.frame( name= r_local$name%>%length(),
                        here_cocktail= r_local$here_cocktail%>%length(),
                        here_dinner = r_local$here_dinner%>%length() ,
                        here_brunch =r_local$here_brunch%>%length(),
                        special_diet=  r_local$special_diet%>%length(),
                        film =   r_local$film%>%length() ,
                        enfant =   r_local$enfant%>%length(),
                        ceremonie =r_local$ceremonie%>%length(),
                        date = r_local$date%>%length()))
      print(r_local$info%>%slice(1))
 #      print(
 #            input$name)
      # Construct the new database
      r_global$data_guests_2 <-
        add_info_guests_in_database(info_to_add = r_local$info,
                                    data_guests = r_global$data_guests_2)

      
      # Upload the new database
      temp_dir <- tempdir()
   
      readr::write_csv(r_global$data_guests_2,
                       glue::glue(temp_dir, "/newdata_guests_2"))
      googledrive::drive_update("site_mariage/new_data_guests_reponse.csv",
                                glue::glue(temp_dir, "/newdata_guests_2"))



      
    })
    
   observeEvent(input$name, ignoreInit = TRUE, {
     # print(
     #   input$name)
      # req(input$name != "Choisir dans la liste la personne")
      # req(r_global$data_guests)
      #
      #       r_local$type_guest <- r_global$data_guests %>%
      #         filter(name == input$name) %>%
      #         pull(type)
      #
      #       if (r_local$type_guest == "Ado") {
      #
      #         output$show_input_teens_menu <- renderUI({
      #
      #           selectInput(
      #             inputId = ns("teens_menu"),
      #             label = "Menu pour le d\u00eener - le menu adulte contient du foie gras et du canard",
      #             choices = c("Menu adulte", "Menu enfant"),
      #             selected = "Menu adulte"
      #           )
      #
      #         })
      #
      #         shinyjs::hide(id = "kids_menu")
      #
      #       } else if (r_local$type_guest == "Enfant") {
      #
      #         output$show_input_kids_menu <- renderUI({
      #
      #           selectInput(
      #             inputId = ns("kids_menu"),
      #             label = "Choix pour les repas (cocktail, d\u00eener, retour)",
      #             choices = c("Menu enfant", "Pas de repas \u00e0 pr\u00e9voir pour mon bibou"),
      #             selected = "Menu enfant"
      #           )
      #
      #         })
      #
      #         shinyjs::hide(id = "teens_menu")
      #
      #       } else {
      #
      #         shinyjs::hide(id = "kids_menu")
      #         shinyjs::hide(id = "teens_menu")
      #
      #       }
      #
    })
    
   
    

    
      })
    }
    
    ## To be copied in the UI
    # mod_tab_confirmation_ui("tab_confirmation_ui_1")
    
    ## To be copied in the server
    # mod_tab_confirmation_server("tab_confirmation_ui_1")
    
    
    # mod_tab_confirmation_ui
    # mod_tab_confirmation_server
 
    

    # donnee_utilisateur <- tibble(
    #   prenom = c("Antoine", "Michele"),
    #   nom= "fabacher",
    #   sexe = c("H", "F"),
    #   enfants = 1,
    #   repas = T
    # )
    # 
    # donnee_utilisateur<-donnee_utilisateur%>%slice(2)
    # ui <- fluidPage(mod_tab_confirmation_ui(1))
    # 
    # server <- function(input, output, session) {
    #   mod_tab_confirmation_server(1, r_global = r_global, donnee_utilisateur =
    #                                 donnee_utilisateur)
    # }
    # 
    # shinyApp(ui, server)