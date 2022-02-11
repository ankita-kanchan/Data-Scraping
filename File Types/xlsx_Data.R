library(xlsx)
xldata <- read.xlsx("xl_data.xlsx", sheetIndex = 1)
print(xldata)
class(xldata)

library(readxl)

xldata= read_excel("xl_data.xlsx")
print(xldata)

my_data = read_excel(file.choose())

class(my_data)
