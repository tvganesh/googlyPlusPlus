#########################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: analyzeBatsmen.R
# More details: https://gigadom.in/
#
#########################################################################################################

# Analyze IPL batsmen
analyzeBatsmen <- function(batsman,func, t20type="IPL") {

    
    # Return when name is NULL at start
    if(is.null(batsman))
        return()
    
    print(batsman)
    
    if(t20type == "IPL"){
        print("ipl")
        dir1="./ipl/iplBattingBowlingDetails/"
        # Check and get the team indices of IPL teams in which the batsman has played
        i <- getTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getTeams(i)
    }
    else if (t20type == "T20M"){
        print("men")
        dir1="./t20/t20BattingBowlingDetails/"
        i <- getT20MTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getT20MTeams(i)
    } else if (t20type == "T20W"){
        print("Women")
        dir1="./t20/t20WomenBattingBowlingDetails/"
        i <- getT20WTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getT20WTeams(i)
    
    } else if (t20type == "BBL"){
        print("BBL")
        dir1="./bbl/bblBattingBowlingDetails/"
        i <- getBBLTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getBBLTeams(i)
        
    } else if (t20type == "NTB"){
        print("NTB")
        dir1="./ntb/ntbBattingBowlingDetails/"
        i <- getNTBTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getNTBTeams(i)
        
    } else if (t20type == "PSL"){
        print("PSL")
        dir1="./psl/pslBattingBowlingDetails/"
        i <- getPSLTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getPSLTeams(i)
        
    } else if (t20type == "WBB"){
        print("WBB")
        dir1="./wbb/wbbBattingBowlingDetails/"
        i <- getWBBTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getWBBTeams(i)
        
    } else if (t20type == "ODIM"){
        print("ODIM")
        dir1="./odi/odiBattingBowlingDetails/"
        i <- getODIMTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getODIMTeams(i)
        
    } else if (t20type == "ODIW"){
        print("ODIW")
        dir1="./odi/odiWomenBattingBowlingDetails/"
        i <- getODIWTeamIndex(batsman, dir1)
        # Get the team names
        teamNames <- getODIWTeams(i)
        
    }

    cat("i=",i,"\n")
    cat("analyze=",getwd())

    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    batsmanDF <- NULL
    # Create a consolidated Data frame of batsman for all IPL teams played
    for (i in seq_along(teamNames)){
          df <- getBatsmanDetails(team=teamNames[i],name=batsman,dir=dir1)
          batsmanDF <- rbind(batsmanDF,df) 
    }
    print(dim(batsmanDF))
    # Call the approporiate function
    if(func == "Batsman Runs vs. Deliveries"){
        batsmanRunsVsDeliveries(batsmanDF,batsman)
    } else if (func == "Predict runs of batsman"){
        batsmanRunsPredict(batsmanDF,batsman)
    }     else if (func == "Dismissals of batsman"){
        batsmanDismissals(batsmanDF,batsman)
    } else if (func == "Batsman's Runs vs Strike Rate"){
        batsmanRunsVsStrikeRate(batsmanDF,batsman)
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(batsmanDF,batsman)
    } else if (func == "Batsman's Cumulative Average Runs"){
        batsmanCumulativeAverageRuns(batsmanDF,batsman)
    } else if (func == "Batsman's Cumulative Strike Rate"){
        batsmanCumulativeStrikeRate(batsmanDF,batsman)
    } else if (func == "Batsman's Runs against Opposition"){
        batsmanRunsAgainstOpposition(batsmanDF,batsman)
    } else if (func == "Batsman's  Runs at Venue"){
        batsmanRunsVenue(batsmanDF,batsman)
    } else if (func == "Predict Runs of batsman"){
        batsmanRunsPredict(batsmanDF,batsman)
    } 
   
}

