# server instructions ----
server <- function(input, output) {
  
  # filter body masses ----
  body_mass_df <- reactive({ 
    penguins %>% 
      filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2]) 
  })
  
  # render the scatter plot ----
  output$bodyMass_scatterPlot <- renderPlot({ 
    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) + 
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
           color = "Penguin species", shape = "Penguin species") + 
      theme_minimal() + 
      theme(legend.position = c(0.85, 0.2), 
            legend.background = element_rect(color = "white")) 
  })
}
