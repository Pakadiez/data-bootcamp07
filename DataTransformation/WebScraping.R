library(rvest)
library(tidyverse)
#1. create variable for url
url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

#2.
url %>%
    read_html() %>%
    html_nodes("h3") %>%
    html_text()

#html_text2() for clean data, remove unnecessory character
url %>%
    read_html() %>%
    html_nodes("h3") %>%
    html_text2()

#in website official, use elements instate of nodes
read_html() %>%
    html_elements("h3") %>%
    html_text2()

#create varible
movie_name <- url %>%
    read_html() %>%
    html_nodes("h3.lister-item-header") %>%
    html_text2()

#more scraping
url %>%
    read_html() %>%
    html_nodes("div.ratings-imdb-rating") %>%
    html_text2()

ratings <- url %>% 
   read_html() %>%
    html_nodes("div.ratings-imdb-rating") %>%
    html_text2() %>%
    as.numeric()ratings

#more scraping
url %>% 
   read_html() %>%
    html_nodes("p.sort-num_votes-visible") %>%
    html_text2()

votes <- url %>%
    read_html() %>%
    html_nodes("p.sort-num_votes-visible") %>%
    html_text2()

#create imdb_df
imdb_df <- data.frame(
    movie_name,
    ratings,
    votes)
view(imdb_df)

#split column
imdb_df %>%
    separate(votes, sep=" | ", into=c("votes", "gross", "tops")) %>%
    View()


#More web scraping example in specphone
specphone_url <- "https://specphone.com/Samsung-Galaxy-S23-5G.html"

specphone_url %>%
    read_html() %>%
    html_nodes("div.topic") %>%
    html_text2()

specphone_url %>%
    read_html() %>%
    html_nodes("div.detail") %>%
    html_text2()


##More web scraping example in Skoodio
url <- "https://medium.com/skooldio"

url %>%
	read_html() %>%
	html_nodes("h3.u-contentSansBold") %>%
	html_text2()
