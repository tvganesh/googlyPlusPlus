#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: printOrPlotMatch.R
# More details: https://gigadom.in/
#
#########################################################################################################
printOrPlotMatch <- function(input,output,t20type="IPL"){
   cat("match dir=",getwd(),"\n")
  
    print("Entering print plot")
    cat("t20=",t20type,"\n")
    # Get the match
    if( t20type == "IPL")
          m <- strsplit(as.character(input$match),"-")
    else if (t20type == "T20M")  
          m <- strsplit(as.character(input$matchT20M),"-")
    else if (t20type == "T20W")  
      m <- strsplit(as.character(input$matchT20W),"-")
    else if (t20type == "BBL")  
      m <- strsplit(as.character(input$matchBBL),"-")
    else if (t20type == "NTB")  
      m <- strsplit(as.character(input$matchNTB),"-")
    else if (t20type == "PSL")  
      m <- strsplit(as.character(input$matchPSL),"-")
    else if (t20type == "WBB")  
      m <- strsplit(as.character(input$matchWBB),"-")    
    else if (t20type == "ODIM")  
      m <- strsplit(as.character(input$matchODIM),"-") 
    else if (t20type == "ODIW")  
      m <- strsplit(as.character(input$matchODIW),"-")     
        
    # Get the teams
    teams <- c(m[[1]][1],m[[1]][2])
  
    cat("team=",teams,"\n")
    # Set the IPL teams
    if( t20type == "IPL"){
      output$selectTeam <- renderUI({ 
          selectInput('team', 'Choose team',choices=teams,selected=input$team)
      })

      otherTeam = setdiff(teams,input$team)
      cat("IPL team=",input$team,"other team=",otherTeam)
    } else if (t20type == "T20M"){
      output$selectTeamT20M <- renderUI({ 
        selectInput('teamT20M', 'Choose team',choices=teams,selected=input$teamT20M)
      })
      otherTeam = setdiff(teams,input$teamT20M)
      cat("T20 team=",input$teamT20M,"other team=",otherTeam)
    } else if (t20type == "T20W"){
      output$selectTeamT20W <- renderUI({ 
        selectInput('teamT20W', 'Choose team',choices=teams,selected=input$teamT20W)
      })
      otherTeam = setdiff(teams,input$teamT20W)
      cat("T20 team=",input$teamT20W,"other team=",otherTeam)
    } else if (t20type == "BBL"){
      output$selectTeamBBL <- renderUI({ 
        selectInput('teamBBL', 'Choose team',choices=teams,selected=input$teamBBL)
      })
      otherTeam = setdiff(teams,input$teamBBL)
      cat("T20 team=",input$teamBBL,"other team=",otherTeam)
    } else if (t20type == "NTB"){
      output$selectTeamNTB <- renderUI({ 
        selectInput('teamNTB', 'Choose team',choices=teams,selected=input$teamNTB)
      })
      otherTeam = setdiff(teams,input$teamNTB)
      cat("T20 team=",input$teamNTB,"other team=",otherTeam)
    } else if (t20type == "PSL"){
      output$selectTeamPSL <- renderUI({ 
        selectInput('teamPSL', 'Choose team',choices=teams,selected=input$teamPSL)
      })
      otherTeam = setdiff(teams,input$teamPSL)
      cat("T20 team=",input$teamPSL,"other team=",otherTeam)
    } else if (t20type == "WBB"){
      output$selectTeamWBB <- renderUI({ 
        selectInput('teamWBB', 'Choose team',choices=teams,selected=input$teamWBB)
      })
      otherTeam = setdiff(teams,input$teamWBB)
      cat("T20 team=",input$teamWBB,"other team=",otherTeam)
    } else if (t20type == "ODIM"){
      output$selectTeamODIM <- renderUI({ 
        selectInput('teamODIM', 'Choose team',choices=teams,selected=input$teamODIM)
      })
      otherTeam = setdiff(teams,input$teamODIM)
      cat("T20 team=",input$teamODIM,"other team=",otherTeam)
    } else if (t20type == "ODIW"){
      output$selectTeamODIW <- renderUI({ 
        selectInput('teamODIW', 'Choose team',choices=teams,selected=input$teamODIW)
      })
      otherTeam = setdiff(teams,input$teamODIW)
      cat("T20 team=",input$teamODIW,"other team=",otherTeam)
    }
    
    print(otherTeam)
 

    if(t20type == "IPL")
          a <- analyzeMatches(input$match,input$matchFunc,input$plotOrTable,input$team,otherTeam,t20type)
    else if (t20type == "T20M")
          a <- analyzeMatches(input$matchT20M,input$matchFuncT20M,input$plotOrTableT20M,input$teamT20M,otherTeam,t20type)
    else if (t20type == "T20W")
      a <- analyzeMatches(input$matchT20W,input$matchFuncT20W,input$plotOrTableT20W,input$teamT20W,otherTeam,t20type)
    else if (t20type == "BBL")
      a <- analyzeMatches(input$matchBBL,input$matchFuncBBL,input$plotOrTableBBL,input$teamBBL,otherTeam,t20type)
    else if (t20type == "NTB")
      a <- analyzeMatches(input$matchNTB,input$matchFuncNTB,input$plotOrTableNTB,input$teamNTB,otherTeam,t20type)
    else if (t20type == "PSL")
      a <- analyzeMatches(input$matchPSL,input$matchFuncPSL,input$plotOrTablePSL,input$teamPSL,otherTeam,t20type)
    else if (t20type == "WBB")
      a <- analyzeMatches(input$matchWBB,input$matchFuncWBB,input$plotOrTableWBB,input$teamWBB,otherTeam,t20type)
    else if (t20type == "ODIM")
      a <- analyzeMatches(input$matchODIM,input$matchFuncODIM,input$plotOrTableODIM,input$teamODIM,otherTeam,t20type)    
    else if (t20type == "ODIW")
      a <- analyzeMatches(input$matchODIW,input$matchFuncODIW,input$plotOrTableODIW,input$teamODIW,otherTeam,t20type)   
    
    head(a)
    a
    
}