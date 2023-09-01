# user interface ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("My App Title"), # alternatively, you can use the `h1()` wrapper function
  
  # app subtitle ----
  p(strong("Exploring Antarctic Penguin Data")), # alternatively, `tags$p(tags$strong("text"))`
  
  # body mass slider ----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g):", 
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # checkboxGroupInput(inputId = , label = "Select year(s):",
  #                    )
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterPlot")
)

