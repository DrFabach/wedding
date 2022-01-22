  # Launch the ShinyApp (Do not remove this comment)
  # To deploy, run: rsconnect::deployApp()
  # Or use the blue button on top of this file

  Sys.setenv(GOOGLE_MAIL = "thibautfabacher@gmail.com")
  pkgload::load_all(export_all = FALSE, helpers = FALSE, attach_testthat = FALSE)
  options( "golem.app.prod" = TRUE)
  wedding::run_app() # add parameters here (if any)
      
