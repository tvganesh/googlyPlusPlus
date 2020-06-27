#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: server.R
# More details: https://gigadom.in/
#
#########################################################################################################
library(shiny)
library(yorkr)
library(rpart)
library(dplyr)
library(ggplot2)
library(rpart.plot)

# Source files

source("definitions.R")
source("IPLutilities.R")
source("T20Mutilities.R")
source("T20Wutilities.R")
source("BBLutilities.R")
source("NTButilities.R")
source("PSLutilities.R")
source("WBButilities.R")
source("ODIMutilities.R")
source("ODIWutilities.R")
source("analyzeBatsmen.R")
source("analyzeBowlers.R")
source("analyzeMatches.R")
source("analyzeMatches2Teams.R")
source("analyzeTeamPerfOverall.R")
source("printOrPlotMatch.R")
source('printOrPlotMatch2Teams.R')
source('printOrPlotTeamPerfOverall.R')
shinyServer(function(input, output,session) {
    
    # Analyze and display batsmen plots
    output$batsmanPlotIPL <- renderPlot({  
        analyzeBatsmen(input$batsmanIPL,input$batsmanFuncIPL, "IPL")
        
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotIPL <- renderPlot({  
        analyzeBowlers(input$bowlerIPL,input$bowlerFuncIPL)
        
    })
    
    ######################################## IPL Match  #############################################
    # Analyze and display IPL Match plot
    output$IPLMatchPlot <- renderPlot({ 
        printOrPlotMatch(input, output,"IPL")
     
    })
    
    # Analyze and display IPL Match table
    output$IPLMatchPrint <- renderTable({ 
        a <- printOrPlotMatch(input, output,"IPL")
        a 
        
    })
    # Output either a table or a plot 
    output$plotOrPrintIPLMatch <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"IPL"))){
            tableOutput("IPLMatchPrint")
        }
        else{ #Else plot
            plotOutput("IPLMatchPlot")
        }
      
    })
   
    #################################### IPL Matches between 2 teams ######################
    # Analyze Head to head confrontation of IPL teams
    
    # Analyze and display IPL Matches between 2 teams plot
    output$IPLMatch2TeamsPlot <- renderPlot({ 
        printOrPlotMatch2Teams(input, output)
        
    })
    
    # Analyze and display IPL Match table
    output$IPLMatch2TeamsPrint <- renderTable({ 
        a <- printOrPlotMatch2Teams(input, output)
        a
        #a
    })
    # Output either a table or a plot 
    output$plotOrPrintIPLMatch2teams <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output))){
            tableOutput("IPLMatch2TeamsPrint")
        }
        else{ #Else plot
            plotOutput("IPLMatch2TeamsPlot")
        }
        
    })
    

    
    ################################ IPL Teams's overall performance ##############################
    # Analyze overall IPL team performance plots
    output$IPLTeamPerfOverallPlot <- renderPlot({ 
        printOrPlotTeamPerfOverall(input, output)
        
    })
    
    # Analyze and display IPL Match table
    output$IPLTeamPerfOverallPrint <- renderTable({ 
        a <- printOrPlotTeamPerfOverall(input, output)
        a
        
    })
    # Output either a table or a plot 
    output$printOrPlotIPLTeamPerfoverall <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output))){
            tableOutput("IPLTeamPerfOverallPrint")
        }
        else{ #Else plot
            plotOutput("IPLTeamPerfOverallPlot")
        }
    })   

    
##########################################################################################
# T20 Men
    
    # Analyze and display batsmen plots
    output$batsmanPlotT20M <- renderPlot({  
      analyzeBatsmen(input$batsmanT20M,input$batsmanFuncT20M, "T20M")
      
    })
    
    
    # Analyze and display bowler plots
    output$bowlerPlotT20M <- renderPlot({  
          analyzeBowlers(input$bowlerT20M,input$bowlerFuncT20M, "T20M")
    })
    
    
    ######################################## T20 Men's Match  #############################################
    # Analyze and display T20 Match plot
    output$T20MMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"T20M")
      
    })
    
    # Analyze and display T20 Match table
    output$T20MMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"T20M")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintT20MMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"T20M"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("T20MMatchPrint")
      }
      else{ #Else plot
        plotOutput("T20MMatchPlot")
      }
      
    })
    
    #################################### T20 Men's Matches between 2 teams ######################
    # Analyze Head to head confrontation of T20 Mens teams
    
    # Analyze and display T20 Men Matches between 2 teams plot
    output$T20MMatch2TeamsPlot <- renderPlot({ 
      print("plot")
      printOrPlotMatch2Teams(input, output,"T20M")
      
    })
    
    # Analyze and display IPL Match table
    output$T20MMatch2TeamsPrint <- renderTable({ 
      print("table")
      a <- printOrPlotMatch2Teams(input, output,"T20M")
      a
      #a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintT20MMatch2teams <-  renderUI({ 
      print("Server ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"T20M"))){
        tableOutput("T20MMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("T20MMatch2TeamsPlot")
      }
      
    })
    
    
    
    ################################ T20 Men's Teams's overall performance ##############################
    # Analyze overall T20 Mens team performance plots
    output$T20MTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"T20M")
      
    })
    
    # Analyze and display IPL Match table
    output$T20MTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"T20M")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotT20MTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"T20M"))){
        tableOutput("T20MTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("T20MTeamPerfOverallPlot")
      }
    })   
    
    ##########################################################################################
    # T20 Women
    
    # Analyze and display batsmen plots
    output$batsmanPlotT20W <- renderPlot({  
      analyzeBatsmen(input$batsmanT20W,input$batsmanFuncT20W, "T20W")
      
    })   
    
    
    # Analyze and display bowler plots
    output$bowlerPlotT20W <- renderPlot({  
      analyzeBowlers(input$bowlerT20W,input$bowlerFuncT20W, "T20W")
      
    })
    
    ######################################## T20 Women's Match  #############################################
    # Analyze and display T20 Match plot
    output$T20WMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"T20W")
      
    })
    
    # Analyze and display T20 Match table
    output$T20WMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"T20W")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintT20WMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"T20W"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("T20WMatchPrint")
      }
      else{ #Else plot
        plotOutput("T20WMatchPlot")
      }
      
    })
    
    #################################### T20 Women's Matches between 2 teams ######################
    # Analyze Head to head confrontation of T20 Womens teams
    
    # Analyze and display T20 Women Matches between 2 teams plot
    output$T20WMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"T20W")
      
    })
    
    # Analyze and display IPL Match table
    output$T20WMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"T20W")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintT20WMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"T20W"))){
        tableOutput("T20WMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("T20WMatch2TeamsPlot")
      }
      
    })
    
    ################################ T20 Women's Teams's overall performance ##############################
    # Analyze overall T20 Womens team performance plots
    output$T20WTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"T20W")
      
    })
    
    # Analyze and display IPL Match table
    output$T20WTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"T20W")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotT20WTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"T20W"))){
        tableOutput("T20WTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("T20WTeamPerfOverallPlot")
      }
    })   
    
    ##########################################################################################
    # Big Bash League
    
    # Analyze and display batsmen plots
    output$batsmanPlotBBL <- renderPlot({  
      analyzeBatsmen(input$batsmanBBL,input$batsmanFuncBBL, "BBL")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotBBL <- renderPlot({  
      analyzeBowlers(input$bowlerBBL,input$bowlerFuncBBL, "BBL")
      
    })
    
    ########################################  BBL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$BBLMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"BBL")
      
    })
    
    # Analyze and display T20 Match table
    output$BBLMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"BBL")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintBBLMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"BBL"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("BBLMatchPrint")
      }
      else{ #Else plot
        plotOutput("BBLMatchPlot")
      }
      
    })
    
    #################################### BBL  Matches between 2 teams ######################
    # Analyze Head to head confrontation of BBL T20  teams
    
    # Analyze and display BBL T20  Matches between 2 teams plot
    output$BBLMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"BBL")
      
    })
    
    # Analyze and display BBL Match table
    output$BBLMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"BBL")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintBBLMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"BBL"))){
        tableOutput("BBLMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("BBLMatch2TeamsPlot")
      }
      
    })
    
    ################################ BBL T20  Teams's overall performance ##############################
    # Analyze overall BBL  team performance plots
    output$BBLTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"BBL")
      
    })
    
    # Analyze and display IPL Match table
    output$BBLTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"BBL")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotBBLTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"BBL"))){
        tableOutput("BBLTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("BBLTeamPerfOverallPlot")
      }
    
   })
    
    ##########################################################################################
    # Natwest T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotNTB <- renderPlot({  
      analyzeBatsmen(input$batsmanNTB,input$batsmanFuncNTB, "NTB")
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotNTB <- renderPlot({  
      analyzeBowlers(input$bowlerNTB,input$bowlerFuncNTB, "NTB")
    })
    
    ########################################  NTB T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$NTBMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"NTB")
      
    })
    
    # Analyze and display T20 Match table
    output$NTBMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"NTB")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintNTBMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"NTB"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("NTBMatchPrint")
      }
      else{ #Else plot
        plotOutput("NTBMatchPlot")
      }
      
    })
    
    #################################### NTB  Matches between 2 teams ######################
    # Analyze Head to head confrontation of NTB T20  teams
    
    # Analyze and display NTB T20  Matches between 2 teams plot
    output$NTBMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"NTB")
      
    })
    
    # Analyze and display NTB Match table
    output$NTBMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"NTB")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintNTBMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"NTB"))){
        tableOutput("NTBMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("NTBMatch2TeamsPlot")
      }
      
    })
    
    ################################ NTB T20  Teams's overall performance ##############################
    # Analyze overall NTB  team performance plots
    output$NTBTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"NTB")
      
    })
    
    # Analyze and display NTB Match table
    output$NTBTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"NTB")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotNTBTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"NTB"))){
        tableOutput("NTBTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("NTBTeamPerfOverallPlot")
      }
      
    })
    
    ##########################################################################################
    # PSL T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotPSL <- renderPlot({  
      analyzeBatsmen(input$batsmanPSL,input$batsmanFuncPSL, "PSL")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotPSL <- renderPlot({  
      analyzeBowlers(input$bowlerPSL,input$bowlerFuncPSL, "PSL")
    })
    
    ########################################  PSL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$PSLMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"PSL")
      
    })
    
    # Analyze and display T20 Match table
    output$PSLMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"PSL")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintPSLMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"PSL"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("PSLMatchPrint")
      }
      else{ #Else plot
        plotOutput("PSLMatchPlot")
      }
      
    })
    
    #################################### PSL  Matches between 2 teams ######################
    # Analyze Head to head confrontation of PSL T20  teams
    
    # Analyze and display PSL T20  Matches between 2 teams plot
    output$PSLMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"PSL")
      
    })
    
    # Analyze and display PSL Match table
    output$PSLMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"PSL")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintPSLMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"PSL"))){
        tableOutput("PSLMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("PSLMatch2TeamsPlot")
      }
      
    })
    
    ################################ PSL T20  Teams's overall performance ##############################
    # Analyze overall PSL  team performance plots
    output$PSLTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"PSL")
      
    })
    
    # Analyze and display PSL Match table
    output$PSLTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"PSL")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotPSLTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"PSL"))){
        tableOutput("PSLTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("PSLTeamPerfOverallPlot")
      }
      
    })
    
    ##########################################################################################
    # WBBL T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotWBB <- renderPlot({  
      analyzeBatsmen(input$batsmanWBB,input$batsmanFuncWBB, "WBB")
      
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotWBB <- renderPlot({  
      analyzeBowlers(input$bowlerWBB,input$bowlerFuncWBB, "WBB")
    })
    
    ########################################  WBBL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$WBBMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"WBB")
      
    })
    
    # Analyze and display T20 Match table
    output$WBBMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"WBB")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintWBBMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"WBB"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("WBBMatchPrint")
      }
      else{ #Else plot
        plotOutput("WBBMatchPlot")
      }
      
    })
    
    #################################### WBB  Matches between 2 teams ######################
    # Analyze Head to head confrontation of WBB T20  teams
    
    # Analyze and display WBB T20  Matches between 2 teams plot
    output$WBBMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"WBB")
      
    })
    
    # Analyze and display WBB Match table
    output$WBBMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"WBB")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintWBBMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"WBB"))){
        tableOutput("WBBMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("WBBMatch2TeamsPlot")
      }
      
    })
    
    ################################ WBB T20  Teams's overall performance ##############################
    # Analyze overall WBB  team performance plots
    output$WBBTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"WBB")
      
    })
    
    # Analyze and display WBB Match table
    output$WBBTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"WBB")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotWBBTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"WBB"))){
        tableOutput("WBBTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("WBBTeamPerfOverallPlot")
      }
      
    })
    
    ##########################################################################################
    
    ##########################################################################################
    # ODI Men
    
    # Analyze and display batsmen plots
    output$batsmanPlotODIM <- renderPlot({  
      analyzeBatsmen(input$batsmanODIM,input$batsmanFuncODIM, "ODIM")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotODIM <- renderPlot({  
      analyzeBowlers(input$bowlerODIM,input$bowlerFuncODIM, "ODIM")
    })
    
    ########################################  ODI Men Match  #############################################
    # Analyze and display ODI Men Match plot
    output$ODIMMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"ODIM")
      
    })
    
    # Analyze and display ODI Men Match table
    output$ODIMMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"ODIM")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintODIMMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"ODIM"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("ODIMMatchPrint")
      }
      else{ #Else plot
        plotOutput("ODIMMatchPlot")
      }
      
    })
    
    # Analyze Head to head confrontation of ODI Men  teams
    
    # Analyze and display ODI Men  Matches between 2 teams plot
    output$ODIMMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"ODIM")
      
    })
    
    # Analyze and display ODIM Match table
    output$ODIMMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"ODIM")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintODIMMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"ODIM"))){
        tableOutput("ODIMMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("ODIMMatch2TeamsPlot")
      }
      
    })
    
    ################################ ODI Men  Teams's overall performance ##############################
    # Analyze overall ODIM  team performance plots
    output$ODIMTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"ODIM")
      
    })
    
    # Analyze and display ODIM Match table
    output$ODIMTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"ODIM")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotODIMTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"ODIM"))){
        tableOutput("ODIMTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("ODIMTeamPerfOverallPlot")
      }
      
    })
    
    
    ##########################################################################################
    # ODI Women
    
    # Analyze and display batsmen plots
    output$batsmanPlotODIW <- renderPlot({  
      analyzeBatsmen(input$batsmanODIW,input$batsmanFuncODIW, "ODIW")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotODIW <- renderPlot({  
      analyzeBowlers(input$bowlerODIW,input$bowlerFuncODIW, "ODIW")
    })
    
    ########################################  ODI Women Match  #############################################
    # Analyze and display ODI Women Match plot
    output$ODIWMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"ODIW")
      
    })
    
    # Analyze and display ODI Women Match table
    output$ODIWMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"ODIW")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintODIWMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"ODIW"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("ODIWMatchPrint")
      }
      else{ #Else plot
        plotOutput("ODIWMatchPlot")
      }
      
    })
    
    
    ##########################################################################################
    
    # Analyze Head to head confrontation of ODI Women  teams
    
    # Analyze and display ODI Women  Matches between 2 teams plot
    output$ODIWMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"ODIW")
      
    })
    
    # Analyze and display ODIW Match table
    output$ODIWMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"ODIW")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintODIWMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"ODIW"))){
        tableOutput("ODIWMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("ODIWMatch2TeamsPlot")
      }
      
    })
    
    ################################ ODI Women  Teams's overall performance ##############################
    # Analyze overall ODI Women  team performance plots
    output$ODIWTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"ODIW")
      
    })
    
    # Analyze and display ODIW Match table
    output$ODIWTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"ODIW")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotODIWTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"ODIW"))){
        tableOutput("ODIWTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("ODIWTeamPerfOverallPlot")
      }
      
    })
    
    
})




