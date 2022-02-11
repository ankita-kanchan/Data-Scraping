library(rvest) #web scrape 
library(stringr)
url ="http://books.toscrape.com/catalogue/category/books_1/index.html"

page_data = read_html(url)

print(page_data)

#scraping all titles
title=page_data %>% html_nodes('h3') %>% html_node('a') %>% html_text() 
title 


# scraping image urls 

#class => .class_name
#id  => #id_name
book_page_url =page_data %>% html_nodes(".image_container") %>% 
  html_nodes("a") %>% html_attr("href")
book_page_url
img_url=page_data %>% html_nodes(".image_container") %>% html_nodes("a") %>%
  html_nodes('img') %>% html_attr("src")
img_url

#Scrape all book ratings

rating = page_data %>% html_nodes("p.star-rating") %>%
  html_attr("class") %>% str_replace_all('star-rating ','')
rating

#Scrapigng all the prices 

price = page_data %>% html_nodes("p.price_color") %>% html_text()
price

#Scraping availability 

availablity= page_data %>% html_nodes("p.instock ") %>% html_text() %>% str_trim()
availablity 


book_data = data.frame("Title"=title,"Book_Page_URL"=book_page_url,"Image_URL"=img_url,"Rating"=rating,"Price"=price,"Availability"= availablity)
book_data

write.csv(book_data,"book.csv",row.names = FALSE)
