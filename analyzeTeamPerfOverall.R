#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: analyzeTeamPerfOverall.R
# More details: https://gigadom.in/
#
#########################################################################################################
# Analyze an IPL team's performance in all matches
analyzeTeamPerfOverall <- function(matches,matchFunc,team,rankV,plotOrTable2,repType2,t20type="IPL") {
  
  if(t20type == "IPL"){
    # Check and get the team indices of IPL teams in which the bowler has played
    IPLmatch <- paste("./ipl/iplAllMatchesAllTeams/", matches,".RData",sep="")
    load(IPLmatch)
    matchesDF <- matches
    print(repType2)
  } else if (t20type == "T20M"){
    T20Mmatch <- paste("./t20/t20AllMatchesAllTeams/", matches,".RData",sep="")
    load(T20Mmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "T20W"){
    T20Wmatch <- paste("./t20/t20WomenAllMatchesAllTeams/", matches,".RData",sep="")
    load(T20Wmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "BBL"){
    BBLmatch <- paste("./bbl/bblAllMatchesAllTeams/", matches,".RData",sep="")
    load(BBLmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "NTB"){
    NTBmatch <- paste("./ntb/ntbAllMatchesAllTeams/", matches,".RData",sep="")
    load(NTBmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "NTB"){
    NTBmatch <- paste("./ntb/ntbAllMatchesAllTeams/", matches,".RData",sep="")
    load(NTBmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "PSL"){
    PSLmatch <- paste("./psl/pslAllMatchesAllTeams/", matches,".RData",sep="")
    load(PSLmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "WBB"){
    WBBmatch <- paste("./wbb/wbbAllMatchesAllTeams/", matches,".RData",sep="")
    load(WBBmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "ODIM"){
    ODIMmatch <- paste("./odi/odiAllMatchesAllTeams/", matches,".RData",sep="")
    load(ODIMmatch)
    matchesDF <- matches
    print(repType2)
    
  } else if (t20type == "ODIW"){
    cat("dir=","\n")
    cat(dir("./odi/odiWomenAllMatchesAllTeams/"))
    ODIWmatch <- paste("./odi/odiWomenAllMatchesAllTeams/", matches,".RData",sep="")
    load(ODIWmatch)
    matchesDF <- matches
    print(repType2)
    
  }
    
    if(plotOrTable2 == 1){
        val3=TRUE
    } else {
        val3= FALSE
    }
    

    

    # Call the correct function
    if(matchFunc == "Team Batting Scorecard Overall"){
        teamBattingScorecardAllOppnAllMatches(matchesDF,team)
    } else if (matchFunc == "Team Batsmen Partnerships Overall"){
        if(val3 == TRUE){
            teamBatsmenPartnershipAllOppnAllMatchesPlot(matchesDF,team,main=team,plot=val3)
        } else if(val3 == FALSE){
            if(repType2 ==1){
                teamBatsmenPartnershipAllOppnAllMatches(matchesDF,team,report="summary")
            } else if(repType2 ==2){
                teamBatsmenPartnershipAllOppnAllMatches(matchesDF,team,report="detailed")
            }
        }
        
        
    } else if (matchFunc == "Team Batsmen vs Bowlers Overall"){
        if(val3 == TRUE){
           df <- teamBatsmenVsBowlersAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV),dispRows = 20)
           teamBatsmenVsBowlersAllOppnAllMatchesPlot(df)
        } else {
            teamBatsmenVsBowlersAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))
        }
        
    } else if(matchFunc == "Team Bowling Scorecard Overall"){
        teamBowlingScorecardAllOppnAllMatchesMain(matchesDF,theTeam=team)
        
    } else if (matchFunc == "Team Bowler vs Batsmen Overall"){
        if(val3 == TRUE){
           df <- teamBowlersVsBatsmenAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))  
           teamBowlersVsBatsmenAllOppnAllMatchesPlot(df,team,team)
        } else {
            teamBowlersVsBatsmenAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))  
        }
        
  
    } else if (matchFunc == "Team Bowler Wicket Kind Overall"){
        teamBowlingWicketKindAllOppnAllMatches(matchesDF,team,"All")

    }
    
}
