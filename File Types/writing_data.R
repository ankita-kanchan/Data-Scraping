# Writing Data in r 

# write.csv()

df = data.frame(id=c(1,2,3,4,5),name=c("A","B","C","D","E"))
df

write.csv(df,"mydata.csv")

?write.csv 

#Write table 

write.table(df,"mytable.csv",sep=",",row.names = FALSE)

read.table("mytable.csv")


# write xlsx 

library(xlsx)
 
write.xlsx(df,"myexl.xlsx",sheetName="1")

write.xlsx(df,"myexl.xlsx",sheetName="2",append=TRUE)

#write 

write(c(1,2,3,4),"data.txt",sep="\n")

