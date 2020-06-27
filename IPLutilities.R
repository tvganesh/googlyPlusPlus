#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Jun 2020
# File: IPLutilities.R
# More details: https://gigadom.in/
#
#########################################################################################################
library(dplyr)

# Run this function first. This is imporant to create the data sets
getIPLBatsmen <- function(dir="."){
  teams <-c("Chennai Super Kings","Deccan Chargers","Delhi Daredevils",
            "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
            "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
            "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
            "Rising Pune Supergiants")
  
  cwd=getwd()
  print("iplbatsmen")
  cat("iplbats=",cwd)
  battingDF <- NULL
  for(team in teams){
    battingDetails <- NULL
    val <- paste(dir,"/",team,"-BattingDetails.RData",sep="")
    print(val)
    tryCatch(load(val),
             error = function(e) {
               print("No data1")
               setNext=TRUE
             }
             
             
    )
    details <- battingDetails
    
    # Save individual team batsmen separately
    df1 <- select(details,batsman,runs,strikeRate)
    a1 <- df1 %>% distinct(batsman)
    a1$batsman = as.character(a1$batsman)
    teamBatsmen <- a1[order(a1$batsman),]
    teamFile = paste(dir,"/",team,"-batsmen.rds",sep="")
    saveRDS(teamBatsmen, file=teamFile)
    
    
    # Create DF of all batsmen
    battingDF <- rbind(battingDF,details)
  }

  df <- select(battingDF,batsman,runs,strikeRate)
  a <- df %>% distinct(batsman)
  a$batsman = as.character(a$batsman)
  iplBatsmen <- a[order(a$batsman),]
  
  # Create all batsmen from all teams for display in UI
  batsmenFile=  paste(dir,"/","IPLBatsmen.RData",sep="")
  save(iplBatsmen, file=batsmenFile)
  cat("iplba=",getwd())
}

# Get the team indices of IPL teams for which the bowler as played
getTeamIndex <- function(batsman,dir="."){  
  teams <-c("Chennai Super Kings","Deccan Chargers","Delhi Daredevils",
                                              "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
                                              "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
                                              "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
                                              "Rising Pune Supergiants")

  cwd=getwd()

  cat("Entering IPL teamIndex",getwd(),"\n")
  cat("cwd=",cwd,"\n")
  cat(getwd(),"\n")


  for(team in teams){
     # Set the name of the data frame
     val <- paste(team,"-batsmen",sep="")
     batsmen <- paste(cwd,'/',dir,"/",team,"-batsmen.rds",sep="")
     cat("tibat=",batsmen,"\n")
     df <-readRDS(batsmen)
     #Assign a name to the dataframe
     m <-assign(val,df)
    
  } 
  
  #Load add dataframes
  teamsBatsmen = list(`Chennai Super Kings-batsmen`,`Deccan Chargers-batsmen`,`Delhi Daredevils-batsmen`,
                      `Kings XI Punjab-batsmen`,`Kochi Tuskers Kerala-batsmen`,`Kolkata Knight Riders-batsmen`,
                      `Mumbai Indians-batsmen`,`Pune Warriors-batsmen`,`Rajasthan Royals-batsmen`,
                      `Royal Challengers Bangalore-batsmen`,`Sunrisers Hyderabad-batsmen`,
                      `Gujarat Lions-batsmen`,`Rising Pune Supergiants-batsmen`)
  b <- NULL
  for (i in 1:length(teamsBatsmen)){
    a <- which(teamsBatsmen[[i]] == batsman)
    
    if(length(a) != 0)
      b <- c(b,i)
  }
  cat("Exiting teamindex=",getwd(),"\n")
  b

}


getIPLBowlers <- function(dir="."){
  teams <-c("Chennai Super Kings","Deccan Chargers","Delhi Daredevils",
            "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
            "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
            "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
            "Rising Pune Supergiants")
  
  cwd=getwd()
  cat("bowlers=",cwd,"\n")
  print(dir)
  bowlingDF <- NULL
  for(team in teams){
    bowlingDetails <- NULL
    val <- paste(dir,"/",team,"-BowlingDetails.RData",sep="")
    print(val)
    tryCatch(load(val),
             error = function(e) {
               print("No data1")
               setNext=TRUE
             }
             
             
    )
    details <- bowlingDetails
    # Save individual team batsmen separately
    df1 <- select(details,bowler,economyRate)
    print(dim(df1))
    a1 <- df1 %>% distinct(bowler)
    a1$bowler = as.character(a1$bowler)
    teamBowlers <- a1[order(a1$bowler),]
    teamFile = paste(dir,"/",team,"-bowlers.rds",sep="")
    saveRDS(teamBowlers, file=teamFile)
    
    
    # Create DF of all batsmen
    bowlingDF <- rbind(bowlingDF,details)
  }
  
  df <- select(bowlingDF,bowler,economyRate)
  a <- df %>% distinct(bowler)
  a$bowler = as.character(a$bowler)
  iplBowlers <- a[order(a$bowler),]
  
  # Create all batsmen from all teams for display in UI
  bowlersFile=  paste(dir,"/","IPLBowlers.RData",sep="")
  save(iplBowlers, file=bowlersFile)
  cat("bowlers=",getwd(),"\n")
}

# Get the team indices of IPL teams for which the bowler as played
getTeamIndex_bowler <- function(bowler,dir="."){
  teams <-c("Chennai Super Kings","Deccan Chargers","Delhi Daredevils",
            "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
            "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
            "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
            "Rising Pune Supergiants")

  cwd=getwd()
  cat("Entering teamIndex_bowlers",getwd(),"\n")
  cat("cwd=",cwd,"\n")

  cat(getwd(),"\n")  
  for(team in teams){
    # Set the name of the data frame
    val <- paste(team,"-bowlers",sep="")
    bowlers <- paste(dir,"/",team,"-bowlers.rds",sep="")
    df <-readRDS(bowlers)
    #Assign a name to the dataframe
    m <-assign(val,df)
    
  } 
  cat("bowlerindex=",getwd(),"\n")
  #Load add dataframes
  teamsBowlers = list(`Chennai Super Kings-bowlers`,`Deccan Chargers-bowlers`,`Delhi Daredevils-bowlers`,
                      `Kings XI Punjab-bowlers`,`Kochi Tuskers Kerala-bowlers`,`Kolkata Knight Riders-bowlers`,
                      `Mumbai Indians-bowlers`,`Pune Warriors-bowlers`,`Rajasthan Royals-bowlers`,
                      `Royal Challengers Bangalore-bowlers`,`Sunrisers Hyderabad-bowlers`,
                      `Gujarat Lions-bowlers`,`Rising Pune Supergiants-bowlers`)
  b <- NULL
  for (i in 1:length(teamsBowlers)){
    a <- which(teamsBowlers[[i]] == bowler)
    
    if(length(a) != 0)
      b <- c(b,i)
  }
  cat("Exiting teamindex_bowlers=",getwd(),"\n")
  b
}

# Get the list of the IPL team names from the indices passed
getTeams <- function(x){

  l <- NULL
  # Get the teams passed in as indexes
  for (i in seq_along(x)){
    
    l <- c(l, IPLTeamNames[[x[i]]]) 
    
  }
  l
}
