#scraping example
library(rvest)
library(stringr)

#try out on a page
testurl<-"https://journal.r-project.org/archive/2017-2/"
testhtml<- read_html(testurl)
articles<-html_nodes(testhtml,'.article')

html_text(articles)
html_attrs(articles)
html_attr(articles, 'href')


get_article_info<-function(article_url) #function for scraping info from a page
{
  authors<-article_url %>% 
    read_html() %>% 
    html_nodes('pre') %>% #bibtex info
    html_text(.) %>% 
    str_extract_all(., "author = \\{.*?\\}") %>% #get authors
    gsub("author = \\{\\s*(.*)}", "\\1", .) #get rid of brackets
  
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