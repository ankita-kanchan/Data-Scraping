df=read.csv("F:\\R Scripts\\Data\\Teams.csv")
df

#1. Group by the team and display all teams
teams=df %>% group_by(Team)
teams$Team
teams

#2. Print all Riders teams Details
teams %>% filter(Team=="Riders")

#3. Print The maximum Points of Year 2014
df %>% filter(Year==2014 & Points==max(Points))

#4. Print all rank 1 teams
df %>% filter(Rank==1)

#5. Print Each Teams Highest Points
teams %>% summarise(Points=max(Points))

#6. Print Each Teams average Points
teams %>% summarise(Avg_Points=mean(Points))