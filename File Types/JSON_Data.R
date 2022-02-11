#read a json file 
library(rjson)

data = fromJSON(file="input.json")
data
class(data)

#accessing elements of json file 

data["ID"]

data[["ID"]][1]

# json to dataframe 

json_df = as.data.frame(data)
json_df

# Writing a json file 

shop =list("product"=list("rice","milk","sugar"),"price"=list(45,24,36))
shop
 

myshop_json = toJSON(shop)
myshop_json

class(myshop_json)


#writting shop json data in a .json file 

write(myshop_json,"shop.json")








 
