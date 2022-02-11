#EDA 
library(tidyverse)
diamonds

str(diamonds)

#Summary
summary(diamonds)

#Visualization of Data Distribution
ggplot(data=diamonds)+geom_bar(aes(x=cut))

#count of cut values 
diamonds %>% count(cut)

#Data under color column
ggplot(data=diamonds)+geom_bar(aes(x=color))

#count of cut values 
diamonds %>% count(color)


#Histogram of distribution of continous variable 

ggplot(data=diamonds)+geom_histogram(aes(x=carat),binwidth = 0.5)

#cut_width
diamonds %>% count(cut_width(carat,0.5))

#filter data of diamonds which is having carat value less than 3 

less_3_carat_dia=diamonds %>% filter(carat < 3)
less_3_carat_dia

ggplot(data=less_3_carat_dia,aes(x=carat,color=cut))+geom_freqpoly(binwidth=0.5)

#x,y,z 

ggplot(data=less_3_carat_dia,aes(x=x))+geom_freqpoly(binwidth=0.5)
ggplot(data=less_3_carat_dia,aes(x=x))+geom_histogram(binwidth=0.5)
diamonds %>% count(cut_width(x,0.5))

#Checking price of diamond for different cuts

ggplot(data=diamonds,aes(x=price))+geom_freqpoly(aes(color=cut),binwidth=500)

ggplot(data=diamonds,aes(x=price,y=..density..))+geom_freqpoly(aes(color=cut),binwidth=500)


#box plot

ggplot(diamonds,aes(x=cut,y=price))+geom_boxplot()


#covariance between two categorical objects

ggplot(diamonds)+geom_count(aes(x=cut,y=color))

diamonds %>% count(color,cut)

diamonds %>% count(color,cut) %>% ggplot(aes(x=color,y=cut))+geom_tile(aes(fill=n))

#covariance between two continous values
ggplot(diamonds)+geom_point(aes(x=carat,y=price))

ggplot(diamonds)+geom_hex(aes(x=carat,y=price))

plot(diamonds)


# select numerical colum

diamand_data = diamonds %>% select("carat","depth", "table","price","x","y","z")

diamand_data

#calculating correlation matrix
cor_mar =cor(diamand_data)
cor_mar

#correlation matrix plot using ggcorrplot
ggcorrplot(cor_mar)


#correlation matrix plot using  corrplot

corrplot(cor_mar,method="shade",title = "diamond data correlation")

#seperate graph for each cut measuring price on y axis for each clarity x axis 

#Facet wraps useful to view individual category graph
diamonds %>% group_by(clarity,cut) %>% summarise(mean_price=mean(price))%>%   ggplot(aes(x=clarity,y=mean_price,color=cut,group=cut))+
  geom_point()+geom_line()+facet_wrap(~cut,nrow = 1) #~ repesents by

#Violin Plot 
diamonds %>% group_by(clarity) %>% ggplot(aes(x=clarity,y=price))+ geom_violin()



diamonds %>% group_by(cut) %>% summarise(max_price = max(price)) %>% ggplot(diamonds %>% group_by(cut) %>% summarise(max_price = max(price)) %>% ggplot(aes(x=cut,y=max_price))+geom_bar())+geom_bar()