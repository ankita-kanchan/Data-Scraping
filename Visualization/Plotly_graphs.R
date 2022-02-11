library(plotly)
data("mtcars")
mtcars

#Scatterplot usig plotly

sp = plot_ly(data = mtcars,x=~hp,y=~wt)
sp

#styling Scattter Plot 

sp= plot_ly(data = mtcars,x=~hp,y=~wt,marker=list(size=10,color='rgba(255,156,100,0.9)'),line=list(width=1))
sp


#group the data 

sp =plot_ly(data = mtcars,x=~hp,y=~wt, color=~gear,size=~gear)
sp


l=plot_ly(mtcars,x=~mpg,y=~wt,mode="lines")
l



x=1:32
data=data.frame(x,mtcars$hp,mtcars$mpg,mtcars$wt)
data

fig = plot_ly(data,x=~x)
fig = fig %>% add_trace(y=~mtcars.hp,name="horsepower",mode="lines")
fig = fig %>% add_trace(y=~mtcars.mpg,name="MPG",mode="lines+markers")
fig = fig %>% add_trace(y=~mtcars.wt,name="Weight",mode="markers")
fig

