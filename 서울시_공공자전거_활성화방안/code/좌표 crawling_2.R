library(RSelenium)
library(stringr)


remDr <- remoteDriver(remoteServerAddr="localhost",
                      port=4444,
                      browserName="chrome")
remDr
remDr$open()
url = "https://www.google.com/maps"
remDr$navigate(url)

inputBox<-remDr$findElement(using="css", "[id=searchboxinput]")

inputBox$sendKeysToElement(list("안양시 동안구 부림로 80"))

btn <-remDr$findElement(using="css", 
                        "[id=searchbox-searchbutton]")
btn$clickElement()

akk = remDr$getCurrentUrl
akk


li_element <- remDr$findElements(using="css",
                                 "[id=insert_data_5]")
myList <- sapply(li_element,function(x){x$getElementText()})
myList




getCurrentUrl()




####################
library(RSelenium)
library(httr)
library(stringr)

remDr <<- remoteDriver(port =4444L,browser='chrome')



name=c('대구대','영남대','계명대')



geo_code=function(name,n=3){
  
  url='https://www.google.com/maps'
  
  remDr$navigate(url)
  
  
  
  search=NULL
  
  while(length(search)==0){
    
    assign('search',remDr$findElement(using='css selector',value='input#searchboxinput.tactile-searchbox-input'))
    
  }
  
  
  
  data=NULL
  
  for(i in 1:length(name)){
    
    search$clearElement()
    
    search$sendKeysToElement(list(name[i],key='enter'))
    
    Sys.sleep(n)
    
    lonlat=as.numeric(str_split(substr(remDr$getCurrentUrl()[[1]],
                                       
                                       regexpr('@',remDr$getCurrentUrl()[[1]])+1,regexpr(',[0-9]+z',remDr$getCurrentUrl()[[1]])-1),',')[[1]])
    
    data=rbind(data,data.frame(name=name[i],lat=lonlat[1],lon=lonlat[2]))
    
  }
  
  return(data)
  
}

geo_code(name)

remDr$close()