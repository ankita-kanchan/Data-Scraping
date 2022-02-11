#Matrix

#matrix(data,nrow,ncol,byrow=FALSE)

#2x2 Matrix

x=matrix(1:4,nrow=2,ncol=2)
x
#creating matrix by row wise
y=matrix(1:9,nrow = 3,byrow=TRUE)
y
#creating matrix by col wise
y=matrix(1:9,ncol = 3,byrow=FALSE)
y

#dim 
dim(y)

matrix(100:105,3,2)

x=matrix(100:105,nrow = 3,ncol = 2, byrow = TRUE)
x

matrix(seq(2,18,2),3,3, byrow=TRUE)

#Adding Column in Matrix

#cbind()

m1= matrix(1:10,nrow = 5)
m1

m_cbind=cbind(m1,c(11:15))
m_cbind


#Adding Rows in Matrix
m2=matrix(1:12,ncol=3,byrow=TRUE)
m2

dim(m2)

m2=rbind(m2,13:15)
m2
dim(m2)


#Concating 2 matrix using c bind

c_mat= cbind(m1,m2)
c_mat


#Accessing Values in Matrix

#matrix[row,col]

m1[1,1]

#Selecting all values from 1st row
m1[1,]

#Selecting all values from 2nd col
m1[,2]

#slicing
#list[start:stop]

#matrix[start:stop,start:stop]

m1[2:4,1:2]
m1[2:4,]

#matrix problems

d=matrix(1:9,3,3)
d
#1 st Que
d[2,2]

#2 nd Que
d[c(1,3),c(1,3)]

d[-2,-2]

#3 rd Que

d[2:3,]

#transpose of matrix
t(m1)

