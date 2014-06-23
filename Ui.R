#setwd("C:/Users/Gianfranco/Dropbox/My Coursera/Developing Data Products/Project1")
library(shiny)
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Petal.Length vs others - Iris dataset"),
  
  # Sidebar with controls to select the variable to plot against Petal.Length
  sidebarPanel(
    
    selectInput("explanatoryvariable", "Explanatory Variable:",
                list("species" = "Species", 
                     "petal width" = "Petal.Width",
                     "sepal length" = "Sepal.Length", 
                     "sepal width" = "Sepal.Width")),
    
    htmlOutput("selectUI"),
    h3(helpText("Instructions:")),
    h5(helpText("This application works with Iris dataset, and explores the correlation between",
             "Petal.Lenght (response variable) with the other numerical variable of the dataset."
             )),
           
    h5(helpText("After choosing the explanatory variable into the selection box above, the input is",
             "used to interactively calculate and print a exploratory plot on the two variables: in case of factor",
             "variable (Species), a boxplot for every species, othewise a scatterplot with the values."
             )), 
    h5(helpText("On the right side, over the plot, (only for numerical variables), a linear model is printed. It builds a model on ",
             "the two variables of interest fitted into the model interactively and shows the linear model R code, the relative coefficients."
             )),
    h5(helpText("After choosing the explanatory variable into the selection box above, the input is",
                "used to interactively calculate and print a exploratory plot on the two variables: in case of factor",
                "variable (Species), a boxplot for every species, othewise a scatterplot with the values."
             )) ,
    h5(helpText("Furthermore, from the interactive bar (only for numerical variables) is possible to select a value for the      ",
                "explanatory variable: this value is used to predict the Petal Length using the linear model fitted, ",
                "and the corresponding prediction is plotted over the same plot"
             )) 
    
  ),
  
    mainPanel(
      h3(textOutput("caption")),
      
      h5(textOutput("lmf")),
      h5(textOutput("lm")),
      
      h5(textOutput("predf")),
      h3(textOutput("labpred")),
      h3(textOutput("pred")),
      
      plotOutput("speciesplot")
    )
))