library(dplyr)

df= data.frame("name"=c("max","jae","alen","john"),"height"=c(156,167,159,169),"weight"=c(56,67,46,65),"class"=c("A","B","B","A"),"marks"=c(45,50,34,28))
df

# Filter 

#get all students from class A
df %>% filter(class=="A")


#get all students from class A  and marks greater than 30
df %>% filter(class=="A" & marks >= 30)


#get all students from class A
df %>% filter(class=="A") %>% arrange(marks)

class_A_stud=df %>% filter(class=="A") %>% arrange(desc(marks)) 
class_A_stud


#sort all the student data on marks desc
df %>% arrange(desc(marks))


#Group By

class_stud = df %>% group_by(class) 

class_stud

#get count of students in each class

class_stud %>% summarise(student_count = n())

#mean,median,max,min,sum,n(count)

class_stud %>% filter(class=="A")

#high marks from both classes

class_stud %>% summarise(Max_Marks=max(marks))

#average marks from both classes
class_stud %>% summarise(avg=mean(marks))

#data engineering 
#mutate 
#generating bmi with weight and height
df %>%  mutate(name,bmi=weight/((height/100) ^2))


#join 

df1=data.frame("name"=c("alex","jae","alen","john"),"address"=c("pune","mumbai","nashik","pune"))
df1

#inner_join
#left_join
#right_join
#full_join
#semi_join
#anti_join

#join_type(first_df,second_df,by=columntojoin)
#inner_join 
df3=inner_join(df,df1,by="name")
df3

#left join
df3=left_join(df,df1,by="name")
df3


#right join
df3=right_join(df,df1,by="name")
df3


#full join
df3=full_join(df,df1,by="name")
df3

#semi_join
df3=semi_join(df,df1,by="name")
df3

#anti_join
df3=anti_join(df,df1,by="name")
df3








