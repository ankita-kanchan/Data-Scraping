data(airquality)
airquality
# Ozone(mean parts per billion)
# Solar.R(Solar Radiation)
# Wind(Average wind speed)
# Temp(maximum daily temperature in Fahrenheit)
# Month(month of observation) 
# Day(Day of the month)

str(airquality)

#head
head(airquality,n=2)

#tail
tail(airquality,n=2)

summary(airquality)


#Basic Plotting

#plot()

plot(airquality$Ozone)


#plotting ozone vs wind

plot(airquality$Ozone,airquality$Wind)

#wind and ozone values are having negative correlation
#wind speed is increasing ozone values are decresasing 

#correlation Matrix of all the columns
plot(airquality)


plot(airquality$Ozone,type="p")
#p=Points
plot(airquality$Ozone,type="l")
#l=lines
plot(airquality$Ozone,type="b")
#b=both
plot(airquality$Ozone,airquality$Wind,type="b")
#h= high density vertical lines
plot(airquality$Ozone,type="h")


#labels and color

plot(airquality$Ozone,xlab = "ozone ",ylab="values",main="Ozone Levels Chart",col="red")


#Bar Plot

#vertical barplot
barplot(airquality$Ozone,main="Ozone Levels Chart",xlab = "ozone",ylab='level',col = "green")

#horizontal barplot

barplot(airquality$Ozone,main="Ozone Levels Chart",xlab = "ozone",ylab='level',col = "green",horiz=TRUE)

#Histogram

hist(airquality$Month)

hist(airquality$Month,main="Month values",col="green")


#Box Plot

boxplot(airquality$Ozone)

#multiplebox plot 
boxplot(airquality)

#Grid Plots
par(mfrow=c(2,2),mar=c(2,5,2,1))
#mar =bottom, left, top, right
boxplot(airquality$Ozone)
plot(airquality$Ozone)
hist(airquality$Ozone)
barplot(airquality$Ozone)
?par











