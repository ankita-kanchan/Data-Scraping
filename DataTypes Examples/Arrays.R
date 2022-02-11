#Arrays

#array(data,dim=c())

arr= array(1:16,dim=c(2,2,4))
arr

#Naming rows and cols

col=c("Col1","Col2")
row=c("row1","row2")
mat=c("mat1","mat2","mat3","mat4")

arr_named= array(1:16,dim=c(2,2,4),dimnames = list(row,col,mat))

arr_named

#Access

arr_named[,,1]

#accesing 1st row of 1st mat

#arr[row,col,matrix]
arr_named[1,,3]

arr_named["row1",,"mat3"]

