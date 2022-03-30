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
  tagList(useShinyalert(), 
    useShinyjs(),
    fluidRow(align = "center",
             tags$div(  img(
               src = glue::glue("www/", "confirmation-2.jpg"), width="100%"
             ), style = "text-align: center; width = 75%")),
    fluidRow(
      align = "center",
      tags$br(style = "line-height: 65px"),
      h1("Confirmation venue", style = "font-family: \'Bauer Bodoni Std 1\'; font-size:30px; letter-spacing:5px; color: black; text-align: center"),      tags$br(style = "line-height: 40px"),
    ),
    uiOutput(ns("confirmation")),
    fluidRow(align="center",
             uiOutput(ns("enfant")),
             # htmltools::tagAppendAttributes(
             # shinyWidgets::materialSwitch(
             #   inputId = ns("ceremonie"),
             #   label = "Souhaitons participer activement à la cérémonie",
             #   value = F,
             #   status = "success",
             #   right = TRUE
             # ) 
             # ,  style = "text-align: initial;"
             # )
    ),   fluidRow(align="center",
                  textInput(
                    inputId = ns("mail"),
                    label = "E-Mail-Adresse :",
                    value = "Kontakt-E-Mail-Adresse"
                    )
    ),
    fluidRow(align="center",
             
          
            shinyWidgets::actionBttn(
               inputId = ns("save_info_guest"),
               label = "Meine Wahl speichern",
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
      observeEvent(BDD,ignoreInit = F,{
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
            label = "Vorname",
            value = ifelse(nb_invite ==1 , "",ifelse(!is.na(prenom_femme),prenom_homme, prenom_femme
            )),
          ),
          tags$br(style = "line-height: 20px"),
          tags$p(
            "Meinen Besuch bestätigen : ",
            style = "font-size:18px; letter-spacing:3px; font-weight: bold; color: black"
          ),
          br(),
        ui_choix_2,
          textInput(
            inputId = ns("film_2"),
            label = "Lieblingsfilm"
        ),
        shinyWidgets::materialSwitch(
          inputId = ns("ceremonie"),
          label = "Ich möchte bei der Zeremonie sprechen!",
          value = F,
          status = "success",
          right = TRUE
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
       
        
        
        ui_choix<- renderUI({
          if(repas){
            return(
          tags$div(
        shinyWidgets::materialSwitch(
          inputId = ns("here_cocktail"),
          label = "Cocktail",
          value = F,
          status = "success",
          right = TRUE
        ),

        shinyWidgets::materialSwitch(
          inputId = ns("here_dinner"),
          label = "Dinner",
          value = F,
          status = "success",
          right = TRUE
        ),
        shinyWidgets::materialSwitch(
          inputId = ns("here_brunch"),
          label = "Brunch",
          value = F,
          status = "success",
          right = TRUE
        ),
          tags$br(style = "line-height: 20px"),
          textInput(
            inputId = ns("special_diet"),
            label = "Besondere Ernährungsweise",
            placeholder = "Allergien. Nahrungsmittelunverträglichkeiten. Diät für Schwangere"
          ))
            )
          }else{
            return(
              tags$div(
                shinyWidgets::materialSwitch(
                  inputId = ns("here_cocktail"),
                  label = "Cocktail",
                  value = F,
                  status = "success",
                  right = TRUE
                )
                
              
            ))    
            
            }
          
          
          })
        
        
        ui_choix_2<- renderUI({
          if(repas){
            return(
              tags$div(
                
                shinyWidgets::materialSwitch(
                  inputId = ns("here_cocktail_2"),
                  label = "Vin d'honneur",
                  value = F,
                  status = "success",
                  right = TRUE
                ),
                
                shinyWidgets::materialSwitch(
                  inputId = ns("here_dinner_2"),
                  label = "Dinner",
                  value = F,
                  status = "success",
                  right = TRUE
                ),
                shinyWidgets::materialSwitch(
                  inputId = ns("here_brunch_2"),
                  label = "Brunch",
                  value = F,
                  status = "success",
                  right = TRUE
                ),
                tags$br(style = "line-height: 20px"),
                textInput(
                  inputId = ns("special_diet_2"),
                  label = "Besondere Ernährungsweise",
                  placeholder = "Allergien. Nahrungsmittelunverträglichkeiten. Diät für Schwangere"
                ))
            )
          }else{
            return(
              tags$div(
                shinyWidgets::materialSwitch(
                  inputId = ns("here_cocktail_2"),
                  label = "Vin d'honneur",
                  value = F,
                  status = "success",
                  right = TRUE
                )
                )
                
                
              )   
            
          }
          
          
        })
        
        
       
        
        
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
              tags$div(id='my_div',
                       class='my_class',
              textInput(
                inputId = ns("name"),
                label = "Vorname",
                value = ifelse(is.na(prenom_femme),prenom_homme, prenom_femme
                ),
              ),
              tags$br(style = "line-height: 20px"),
              tags$p(
                "Meinen Besuch bestätigen : ",
                style = "font-size:18px; letter-spacing:3px; font-weight: bold; color: black"
              ),
              br(),
              ui_choix,
            
            textInput(
              inputId = ns("film"),
              label = "Lieblingsfilm"
            ),
            shinyWidgets::materialSwitch(
              inputId = ns("ceremonie2"),
              label = "Ich möchte bei der Zeremonie sprechen!",
              value = F,
              status = "success",
              right = TRUE
            ))
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
      date= character(), 
      mail =character()
      )
  
    observeEvent(input$save_info_guest, {
      r_local$name <- c(input$name,
                        ifelse(length(input$name_2)==0,"",input$name_2))%>%as.character()
      r_local$here_cocktail= c(input$here_cocktail,
                               ifelse(length(input$here_cocktail_2)==0,"",input$here_cocktail_2)
                             
                               )%>%as.character() 
            r_local$here_dinner = ifelse(length(input$here_dinner)==0,c("F","F"),c(input$here_dinner,
                                                                                   input$here_dinner_2
                                                                                   )%>%as.character())
            r_local$here_brunch =ifelse(length(input$here_dinner)==0,c("F","F"),c(input$here_brunch,
                                                                                  input$here_brunch_2
                                                                                  )%>%as.character())
            r_local$special_diet= ifelse(length(input$here_dinner)==0,c("",""), c(input$special_diet,
                                                                                  input$special_diet_2
                                                                                  )%>%as.character())
            r_local$film =   c(input$film, 
                               input$film_2
                               )%>%as.character()
            r_local$enfant =   input$enfant_1%>%as.character()
            r_local$enfant=ifelse(length(r_local$enfant)==0,c("F","F"),r_local$enfant)
            r_local$ceremonie =  c(input$ceremonie, 
                                   ifelse(length(input$ceremonie_2)==0,"",input$ceremonie_2)
                                  
                                   )%>%as.character()
            r_local$mail =c(input$mail,input$mail)
            
            r_local$date = Sys.time()%>%as.character()
            
      r_local$info<-r_local$info%>%add_row(
      prenom= r_local$name,
      nom =  (data()$nom[1]),
      here_cocktail= r_local$here_cocktail,
      here_dinner = r_local$here_dinner ,
      here_brunch =r_local$here_brunch,
      special_diet=  r_local$special_diet,
      film =   r_local$film ,
      enfant =   r_local$enfant,
      ceremonie =r_local$ceremonie,
      date = r_local$date,
      mail = r_local$mail
      )
      # print(data.frame( name= r_local$name%>%length(),
      #                   here_cocktail= r_local$here_cocktail%>%length(),
      #                   here_dinner = r_local$here_dinner%>%length() ,
      #                   here_brunch =r_local$here_brunch%>%length(),
      #                   special_diet=  r_local$special_diet%>%length(),
      #                   film =   r_local$film%>%length() ,
      #                   enfant =   r_local$enfant%>%length(),
      #                   ceremonie =r_local$ceremonie%>%length(),
      #                   date = r_local$date%>%length()))
      # print(r_local$info%>%slice(1))
 #      print(
 #            input$name)
      # Construct the new database
      r_global$data_guests_2 <-
        add_info_guests_in_database(info_to_add = r_local$info,
                                    data_guests = r_global$data_guests_2)

      library(emayili)
      email <- envelope()
      email <- email %>%
        from("mariage@gmail.com") %>%
        to("thibautfabacher@gmail.com") 
      email <- email %>% subject("Confirmation mariage")
      email <- email %>% text(r_local$info%>%paste(collapse = "\t"))
      smtp <- server(
        host = "smtp.gmail.com",
        port = 465,
        username = "barthimeleus@gmail.com",
        password = "ofpuigtlzflevnwt"
      )
      smtp(email, verbose = TRUE)
      shinyalert("Informations enregistrées !",  type = "success")
      # Upload the new database
      temp_dir <- tempdir()
   
      readr::write_csv(r_global$data_guests_2,
                       glue::glue(temp_dir, "/newdata_guests_2"))
      googledrive::drive_update("site_mariage/new_data_guests_reponse.csv",
                                glue::glue(temp_dir, "/newdata_guests_2"))



      
    })
    
   observeEvent(input$name, ignoreInit = TRUE, {
   
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