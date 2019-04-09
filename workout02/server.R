library(shiny)
library(ggplot2)
source('functions.R')

shinyServer(function(input, output) {
  output$view <- renderTable({
    modalities <- data.frame(Year=0, 
                             x=input$initial, 
                             y=input$initial, 
                             z=input$initial)
    for (y in 1:input$year) {
      fv = future_value(input$initial, input$rate / 100, y)
      modalities <- rbind(modalities,
                          c(y, fv,
                            fv + annuity(input$contrib, input$rate / 100, y),
                            fv + growing_annuity(input$contrib, input$rate / 100, input$growth / 100, y)
                          ))
    }
    colnames(modalities) <- c("Year", "No Contribution", "Fixed Contribution", "Growing Contribution")
    modalities$Year <- as.integer(modalities$Year)
    return(modalities)
  })
  
  output$savingsPlot <- renderPlot({
    modalities <- data.frame(Year=0, Value=0, Modality='HI', stringsAsFactors=F)
    types = c("No Contribution", "Fixed Contribution", "Growing Contribution")
    for (y in 0:input$year) {
      fv = future_value(input$initial, input$rate / 100, y)
      for (i in 1:3) {
        t <- types[i]
        val <- switch(i,
                      fv,
                      fv + annuity(input$contrib, input$rate / 100, y),
                      fv + growing_annuity(input$contrib, input$rate / 100, input$growth / 100, y)
        )
        modalities <- rbind(modalities,
                            c(y, val, t))
      }
    }
    modalities <- modalities[2:nrow(modalities),]
    modalities$Year <- as.numeric(modalities$Year)
    modalities$Value <- as.numeric(modalities$Value)
    modalities$Modality <- factor(modalities$Modality,levels=types)
    
    gg <- ggplot(data=modalities, aes(x=Year, y=Value, colour=Modality)) +
      geom_line() +
      geom_point() +
      labs(x='Year', y='Future Value')
    
    if (input$facet == 'Yes') {
      gg <- gg + facet_wrap(~Modality)
    }
    
    return(gg)
  
  })
  
})