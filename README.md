# stock_performance_overview
Stock Performance Overview TDC, ORCL, IBM
Developing Data Products - Peer Assesment Projects
======================


This README file is the supporting documentation accompanying this Shiny application. It includes three parts: 

1. Instructions given for this project
2. Description of the Shiny application Stock Performance Overview TDC, ORCL, IBM
3. Directives on how to visualize this Shiny application and the Presentation

## 1. Instructions for this project

### Shiny Application
1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github

The application must include the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...)
2. Some operation on the ui input in sever.R
3. Some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

### Reproducible Pitch Presentation

OK, you've made your shiny app, now it's time to make your pitch. You get 5 slides (inclusive of the title slide) to pitch a your app. You're going to create a web page using Slidify or Rstudio Presenter with an html5 slide deck.

Here's what you need

1. 5 slides to pitch our idea done in Slidify or Rstudio Presenter
2. Your presentation pushed to github or Rpubs
3. A link to your github or Rpubs presentation pasted into the provided text box

Your presentation must satisfy the following

1. It must be done in Slidify or Rstudio Presenter
2. It must be 5 pages
3. It must be hosted on github or Rpubs
4. It must contained some embedded R code that gets run when slidifying the document

## 2. Description of this Shiny application

This Shiny application computes the performance indicator of three stocks: TDC, ORCL, IBM. The user can enter a start date and the app calculates by how many percent the close price of the stocks on a particular date deviate from the close price of the stocks on start date. The time series interval can be set by the user.
Data set source: http://www.nasdaq.com/

## 3. How to visualize the Shiny application and the presentation
You can visualize the Shiny application by clicking [here]( https://velida.shinyapps.io/StockPerformance/) or by runing the following commands:

```
library(shiny)
runGitHub( "stock_performance_overview", "velida") 
```
You can access my presentation [here](http://rpubs.com/velida/stockperformance).
