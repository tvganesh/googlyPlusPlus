#########################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: analyzeMatches.R
# More details: https://gigadom.in/
#
#########################################################################################################
#Analyze an IPL match
analyzeMatches <- function(match,matchFunc,plotOrTable,team,opposition,t20type) {
    cat("Entering analyze match=",match,"team=",team)

    cat("match=",match,"func=",matchFunc,"plotOrtbl=",plotOrTable,"team=",team,"oppn=",opposition,"\n")
    # Check and get the team indices of IPL teams in which the bowler has played
    if(t20type == "IPL"){
        IPLmatch <- paste("./ipl/iplMatches/", match,".RData",sep="")
        cat("analymatch=",getwd())
        load(IPLmatch)
        matchDF <- overs
    } else if (t20type == "T20M"){
        T20Mmatch <- paste("./t20/t20MenMatches/", match,".RData",sep="")
        cat("analymatch=",getwd())
        load(T20Mmatch)
        matchDF <- overs  

    } else if (t20type == "T20W"){
        T20Wmatch <- paste("./t20/t20WomenMatches/", match,".RData",sep="")
        cat("analymatchmen Wo=",getwd())
        load(T20Wmatch)
        matchDF <- overs  
        
    } else if (t20type == "BBL"){
        BBLmatch <- paste("./bbl/bblMatches/", match,".RData",sep="")
        cat("analymatchmen BBL=",getwd())
        load(BBLmatch)
        matchDF <- overs  
        
    } else if (t20type == "NTB"){
        NTBmatch <- paste("./ntb/ntbMatches/", match,".RData",sep="")
        cat("analymatchmen NTB=",getwd())
        load(NTBmatch)
        matchDF <- overs  
        
    } else if (t20type == "PSL"){
        PSLmatch <- paste("./psl/pslMatches/", match,".RData",sep="")
        cat("analymatchmen PSL=",getwd())
        load(PSLmatch)
        matchDF <- overs  
        
    } else if (t20type == "WBB"){
        WBBmatch <- paste("./wbb/wbbMatches/", match,".RData",sep="")
        cat("analymatchmen WBB=",getwd())
        load(WBBmatch)
        matchDF <- overs  
        
    } else if (t20type == "ODIM"){
        ODIMmatch <- paste("./odi/odiMenMatches/", match,".RData",sep="")
        cat("analymatchmen ODIM=",getwd())
        load(ODIMmatch)
        matchDF <- overs  
        
    } else if (t20type == "ODIW"){
        ODIWmatch <- paste("./odi/odiWomenMatches/", match,".RData",sep="")
        cat("analymatchmen ODIW=",getwd())
        load(ODIWmatch)
        matchDF <- overs  
        
    }

    cat("dim(match=",dim(matchDF),"\n")    
    print(team)
    if(plotOrTable == 1){
        val=TRUE
    } else {
        val= FALSE
    }
    cat("func=",matchFunc,"\n")
    cat("team=",team,"\n")
    # Call necessary function
    if(matchFunc == "Match Batting Scorecard"){
        teamBattingScorecardMatch(matchDF,team)
    } else if (matchFunc == "Batting Partnerships"){
        teamBatsmenPartnershipMatch(matchDF,team,opposition,plot=val)
    } else if (matchFunc == "Batsmen vs Bowlers"){
        teamBatsmenVsBowlersMatch(matchDF,team,opposition,plot=val)
    }  else if (matchFunc == "Match Bowling Scorecard"){
        teamBowlingScorecardMatch(matchDF,team)    
    } else if (matchFunc == "Bowling Wicket Kind"){
        teamBowlingWicketKindMatch(matchDF,team,opposition, plot=val)
    } else if (matchFunc == "Bowling Wicket Runs"){
        teamBowlingWicketRunsMatch(matchDF,team,opposition, plot=val)
    } else if (matchFunc == "Bowling Wicket Match"){
        teamBowlingWicketMatch(matchDF,team,opposition, plot=val)
    } else if (matchFunc == "Bowler vs Batsmen"){
        teamBowlersVsBatsmenMatch(matchDF,team,opposition, plot=val)
    } else if (matchFunc == "Match Worm Graph"){
        matchWormGraph(matchDF,team,opposition)
    }

    
}

