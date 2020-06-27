#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: printOrPlotMatch2Teams.R
# More details: https://gigadom.in/
#
#########################################################################################################
printOrPlotMatch2Teams <- function(input,output,t20type="IPL"){
    
    print("Entering print plot2 teams")
    cat("t20=",t20type,"\n")
    # Get the teams
    # Get the match
    if( t20type == "IPL")
        p <- strsplit(as.character(input$match2),"-")
    else if (t20type == "T20M")  
        p <- strsplit(as.character(input$match2T20M),"-")
    else if (t20type == "T20W")  
        p <- strsplit(as.character(input$match2T20W),"-")
    else if (t20type == "BBL")  
        p <- strsplit(as.character(input$match2BBL),"-") 
    else if (t20type == "NTB")  
        p <- strsplit(as.character(input$match2NTB),"-")    
    else if (t20type == "PSL")  
        p <- strsplit(as.character(input$match2PSL),"-")    
    else if (t20type == "WBB")  
        p <- strsplit(as.character(input$match2WBB),"-")      
    else if (t20type == "ODIM")  
        p <- strsplit(as.character(input$match2ODIM),"-") 
    else if (t20type == "ODIW")  
        p <- strsplit(as.character(input$match2ODIW),"-")
    
    teams2 <- c(p[[1]][1],p[[1]][2])
    
    cat("teams=",teams2,"\n")
 
    
    
    if( t20type == "IPL"){
        # Set the IPL teams
        output$selectTeam2 <- renderUI({ 
            selectInput('team2', 'Choose team',choices=teams2,selected=input$team2)
        })
        
        #Find the other team
        otherTeam = setdiff(teams2,input$team2)
        cat("IPL team=",input$team2,"other team=",otherTeam)
    } else if (t20type == "T20M"){
        output$selectTeam2T20M <- renderUI({ 
            selectInput('team2T20M', 'Choose team',choices=teams2,selected=input$team2T20M)
        })
        otherTeam = setdiff(teams2,input$team2T20M)
        cat("T20 team=",input$team2T20M,"other team=",otherTeam)
    } else if (t20type == "T20W"){
        output$selectTeam2T20W <- renderUI({ 
            selectInput('team2T20W', 'Choose team',choices=teams2,selected=input$team2T20W)
        })
        otherTeam = setdiff(teams2,input$team2T20W)
        cat("T20 team=",input$team2T20W,"other team=",otherTeam)
    } else if (t20type == "BBL"){
        output$selectTeam2BBL <- renderUI({ 
            selectInput('team2BBL', 'Choose team',choices=teams2,selected=input$team2BBL)
        })
        otherTeam = setdiff(teams2,input$team2BBL)
        cat("T20 team=",input$team2BBL,"other team=",otherTeam)
    }  else if (t20type == "NTB"){
        output$selectTeam2NTB <- renderUI({ 
            selectInput('team2NTB', 'Choose team',choices=teams2,selected=input$team2NTB)
        })
        otherTeam = setdiff(teams2,input$team2NTB)
        cat("T20 team=",input$team2NTB,"other team=",otherTeam)
    }  else if (t20type == "PSL"){
        output$selectTeam2PSL <- renderUI({ 
            selectInput('team2PSL', 'Choose team',choices=teams2,selected=input$team2PSL)
        })
        otherTeam = setdiff(teams2,input$team2PSL)
        cat("T20 team=",input$team2PSL,"other team=",otherTeam)
    }  else if (t20type == "WBB"){
        output$selectTeam2WBB <- renderUI({ 
            selectInput('team2WBB', 'Choose team',choices=teams2,selected=input$team2WBB)
        })
        otherTeam = setdiff(teams2,input$team2WBB)
        cat("T20 team=",input$team2WBB,"other team=",otherTeam)
    } else if (t20type == "ODIM"){
        output$selectTeam2ODIM <- renderUI({ 
            selectInput('team2ODIM', 'Choose team',choices=teams2,selected=input$team2ODIM)
        })
        otherTeam = setdiff(teams2,input$team2ODIM)
        cat("T20 team=",input$team2ODIM,"other team=",otherTeam)
    }  else if (t20type == "ODIW"){
        output$selectTeam2ODIW <- renderUI({ 
            selectInput('team2ODIW', 'Choose team',choices=teams2,selected=input$team2ODIW)
        })
        otherTeam = setdiff(teams2,input$team2ODIW)
        cat("T20 team=",input$team2ODIW,"other team=",otherTeam)
    }       

    
    
    # Analyze matches 2 teams
    if(t20type == "IPL")
        a <- analyzeMatches2Teams(input$match2,input$matches2TeamFunc,input$plotOrTable1,
                              input$repType,input$team2,otherTeam,t20type)
    else if (t20type == "T20M")
        a <- analyzeMatches2Teams(input$match2T20M,input$matches2TeamFuncT20M,input$plotOrTable1T20M,
                                  input$repTypeT20M,input$team2T20M,otherTeam,t20type)
    else if (t20type == "T20W")
        a <- analyzeMatches2Teams(input$match2T20W,input$matches2TeamFuncT20W,input$plotOrTable1T20W,
                                  input$repTypeT20W,input$team2T20W,otherTeam,t20type)
    else if (t20type == "BBL")
        a <- analyzeMatches2Teams(input$match2BBL,input$matches2TeamFuncBBL,input$plotOrTable1BBL, 
                                  input$repTypeBBL,input$team2BBL,otherTeam,t20type)
    else if (t20type == "NTB")
        a <- analyzeMatches2Teams(input$match2NTB,input$matches2TeamFuncNTB,input$plotOrTable1NTB,
                                  input$repTypeNTB,input$team2NTB,otherTeam,t20type)    
    else if (t20type == "PSL")
        a <- analyzeMatches2Teams(input$match2PSL,input$matches2TeamFuncPSL,input$plotOrTable1PSL,
                                  input$repTypePSL,input$team2PSL,otherTeam,t20type)   
    else if (t20type == "WBB")
        a <- analyzeMatches2Teams(input$match2WBB,input$matches2TeamFuncWBB,input$plotOrTable1WBB,
                                  input$repTypeWBB,input$team2WBB,otherTeam,t20type)   
    else if (t20type == "ODIM")
        a <- analyzeMatches2Teams(input$match2ODIM,input$matches2TeamFuncODIM,input$plotOrTable1ODIM,
                                  input$repTypeODIM,input$team2ODIM,otherTeam,t20type)   
    else if (t20type == "ODIW")
        a <- analyzeMatches2Teams(input$match2ODIW,input$matches2TeamFuncODIW,input$plotOrTable1ODIW,
                                  input$repTypeODIW,input$team2ODIW,otherTeam,t20type) 
    
    print("Output oa anlsy2")
    head(a)    
    cat('Exiting print2',dim(a))
    a
}