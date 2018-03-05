#scraping example
library(rvest)
library(stringr)
library(tidyr)


get_article_info<-function(article_url) #function for scraping info from a page
{
  relevant_html<-article_url %>% 
    read_html() %>% 
    html_nodes('pre') %>% #bibtex info
    html_text(.) 
  
  author_info <- relevant_html %>% 
    str_extract_all(., "author = \\{.*?\\}") %>% #get authors
    gsub("author = \\{\\s*(.*)}", "\\1", .) %>%  #get rid of brackets
    strsplit(.," and ") %>% 
    `names<-`(c("author")) %>% 
    as_tibble() %>% 
    rownames_to_column(var="author_num")
    mutate(first_name=)
    
  
  return(authors)
}

scrape_volume<-function(volume_url)
{
  #Get all links within the page and pull out links to article html
  article_urls<-volume_url %>% 
    read_html() %>% 
    html_nodes("a") %>% 
    html_attr("href") %>% #this is all urls
    .[str_detect(., "index.html")] %>% #just article urls
    str_replace("../", "https://journal.r-project.org/archive/")
  
  #Creat object to store info?
  
  for(i in 1:length(article_urls))
  {
    
    
  }
}