#Missing Values

df=data.frame("Name"=c("alex","jae","alen","john"),"Age"=c(23,24,NA,24),"gender"=c("male","male","female",NA))
df

#is.na
is.na(df)

#count of null values in df
sum(is.na(df))

#list of cols with na values
colnames(df)[apply(df,2,anyNA)]

#remove missing values 
na.omit(df)

#replace missing value mean median,mode 

#replace missing values in age column
age_mean=mean(df$Age,na.rm = TRUE)

df$Age[is.na(df$Age)]=as.integer(age_mean)

#Calcuating Mode


getmode <- function(val){
  u= unique(val)
  u[which.max(tabulate(match(val,u)))]
}

getmode(df$gender)

mode <- function(){
  return(sort(-table(df$gender))[1])
}
mode()

#modest
library(modeest)
mode=mfv(df$gender)
mode

#Replacing the NA value from a categorical column
gender_mode=getmode(df$gender)
df$gender[is.na(df$gender)]=gender_mode
df



