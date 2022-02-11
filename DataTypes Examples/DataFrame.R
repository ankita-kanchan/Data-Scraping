#dataFrame

v1=c(1,2,3)
v2=c("alex","john","max")
v3=c(12345,45567,56788)

#data.frame

df =data.frame(v1,v2,v3)
df

# give name to columns
df=data.frame("Sr_no."=v1,"Name"=v2,"Contact"=v3)
df

names(df)

#converting array into a data frame
col=c("Col1","Col2")
row=c("row1","row2")
mat=c("mat1","mat2","mat3","mat4")
d=arr_named= array(1:16,dim=c(2,2,4),dimnames = list(row,col,mat))

as.data.frame(d)

#
names(df)
 
nrow(df)

ncol(df)

summary(df)

str(df)

dim(df)

#Names for renaming colums
v1=c(1,2,3)
v2=c("alex","john","max")
v3=c(12345,45567,56788)

#data.frame

df =data.frame(v1,v2,v3)
df

names(df)=c("A","B","C")
df

#Accessing
df["A"]

df[[1]][1]

df[c("A","B")]

df[["C"]][3]

df[1:2]

#slicing row and column
df[1:2,] 
df[1:2,]

df[1:2,c("A","B")]

df$A

df$A>=2

#selecting data on basis of condition
df[df$A>=2,]









