#Reading xml file

library(XML)
library(methods)

data = xmlParse(file ="xml_input.xml")

print(data)


# Extracting root nodes from xml file 

rootnode= xmlRoot(data)

print(rootnode)


#Getting root node size 

xmlSize(rootnode)

# Get Details of the First Node 

print(rootnode[4])

# Get Different Elements of node 

print(rootnode[[1]][[2]])

print(rootnode[[1]][[4]])

# XML to Dataframe 

xml_dataframe = xmlToDataFrame("xml_input.xml")
xml_dataframe

str(xml_dataframe)

xml_dataframe

#dataframe to xml

xml_new = xmlTree() # Empty XML File 

xml_new$addTag("report",close=FALSE) # Report tag add

for(i in 1:nrow(xml_dataframe)){  # loop for accessing each row
  xml_new$addTag("Employee",close=FALSE) # creating employee tag 
  for(j in names(xml_dataframe)){ # loop for accessing employee information 
    xml_new$addTag(j,xml_dataframe[i,j]) # adding tags with information 
  }
  xml_new$closeTag() # closing employee tag
}
xml_new$closeTag() #closing report tag


xml_new # xml tree

cat(saveXML(xml_new))  # saving xml tree in xml format


library(xml2)
#use xml2 library
write_xml(rootnode,"myxml.xml", option = "as_xml")


library(kulife)

write.xml(xml_dataframe, file = "myxml.xml")
