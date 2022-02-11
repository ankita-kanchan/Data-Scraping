library(tidyverse)
data("airquality")
airquality

summary(airquality)

#cleaning missing values
airquality$Ozone[is.na(airquality$Ozone)] = mean(airquality$Ozone,na.rm = TRUE)

airquality$Solar.R[is.na(airquality$Solar.R)] = mean(airquality$Solar.R,na.rm = TRUE)

summary(airquality)

#Cleaning missing values using mutate/ mutate_all

airquality = airquality %>% mutate_all(~ifelse(is.na(.x),mean(.x,na.rm=TRUE), .x))
summary(airquality)

# ~ indicates the function and .x is considered as argument of function or
#you can use . as well 

#Measure of Central Tendency

#Mean

mean=mean(airquality$Ozone)
print(mean)
  
#median 

median=median(airquality$Ozone)
print(median)

#mode
library(modeest)  
 
mode=mfv(airquality$Month)
mode
  
# Measure of Despersion

#Range 

#calulate max value 
max_ozone=max(airquality$Ozone)

#calulate min value 
min_ozone=min(airquality$Ozone)

range=max_ozone-min_ozone 

cat("Range of Ozone is ",range)

#range method

r=range(airquality$Ozone)
print(r)

#variance 

variance=var(airquality$Ozone)
print(variance)

#Standard Deviation

std = sd(airquality$Ozone)
print(std)
 

#Interquartile Range

#IQR = Q3 - Q1 

iqr=IQR(airquality$Ozone)
print(iqr)

library(moments)

skewness(airquality)

kurtosis(airquality)

# 
# mesokurtic ==0 
# 
# leptokurtic > 0
# 
# platykurtic < 0



