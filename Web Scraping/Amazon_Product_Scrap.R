library(rvest)
library(stringr)
url = "https://www.amazon.in/ASUS-15-6-inch-i7-11800H-RTX-3060-FX566HM-HN100T/dp/B09CCKX5K9/ref=sr_1_8?crid=2W3HDKIJF7GEV&keywords=gaming+laptop&qid=1643612094&sprefix=gaming+%2Cspecialty-aps%2C241&sr=8-8"
webpage = read_html(url)
print(webpage)

title = webpage %>% html_nodes("#productTitle") %>% html_text() %>% str_trim()
title

desc=webpage %>% html_nodes("div#feature-bullets") %>% html_text() %>% str_trim()
desc

rate = webpage %>% html_node("span#acrPopover") %>% html_attr("title")
rate

price = webpage %>%  html_node("span.a-offscreen") %>% html_text()
price

Availability =webpage %>% html_node("#availability") %>% html_node("span") %>% html_text() %>% str_trim()
Availability

brand_info=webpage %>% html_node("#productOverview_feature_div") %>% html_nodes("span") %>% html_text()
brand_info