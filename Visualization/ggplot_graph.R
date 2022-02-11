data("mtcars")
mtcars
library(ggplot2)

#Basic syntax of ggplot

#ggplot(data,mapping=aes(x,y)) + geometric_objects 

#geometric_objects = the type of plot 

#Points - geom_point()
#Bar - geom_bar()
#Line - geom_line()
#Histogram - geom_histogram()

#ScatterPlot

ggplot(mtcars, aes(x = mpg, y = drat)) +  geom_point()


#ScatterPlot with groups

ggplot(mtcars,aes(x = log(mpg), y = log(drat))
       + geom_point(aes(color=factor(gear)))

       
# Scatterplot with fitted values

my_line = ggplot(mtcars,aes(x=mpg,y=drat))
+ geom_point(aes(color=factor(gear))) 
+ stat_smooth(method="lm",col="red",se=FALSE,size=1)

my_line


#Add Information to Graph

#labs (title ="your graph title")
#title
#subtitle
#caption
#x = rename axis x
#y= rename axis y


ggplot(mtcars,aes(x = log(mpg), y = log(drat)))
       + geom_point(aes(color=factor(gear))) + labs(title="MPG vs BRAT",
                                                    )
#Controlling Scales

#scale_x_continuous = controls x-axis
#scale_y_continous= controls y-axis
       

graph=ggplot(mtcars,aes(x = mpg, y = drat,shape=factor(gear))) + geom_point(aes(color=factor(gear)),size=1.8)
graph


graph + labs(title="MPG vs BRAT",x="Miles/(US) gallon",y="Rear axle ratio") +
  scale_x_continuous(breaks=seq(1,40,by=5))+
  scale_y_continuous(breaks=seq(1,6,by=0.5)) +theme_minimal() 

#theme

# 
# theme_bw()
# theme_light()
# theme_classis()
# theme_linedraw()
# theme_dark()
# theme_minimal()
# theme_gray()
# theme_void()

#Save the plot 

dir_path = getwd()
dir_path

ggsave("mygraph.png")
?ggsave #searching syntax

#plotly
