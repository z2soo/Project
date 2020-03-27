
install.packages("RSelenium")
install.packages("readxl")
install.packages("dplyr")
library(dplyr)
library(RSelenium)
library(httr)
library(rvest)
library(readxl)
library(dplyr)
getwd()
setwd("C:/Users/student/Desktop/semiproject")



# 관광 정보에 대한 엑셀 파일
place_info = read_excel(path = "C:/Users/student/Desktop/서울시 관광정보/서울시_분류별_관광명소_현황(한국어).xls",
                        col_names = TRUE)
View(place_info)
str(ad)



# selenium을 이용한 동적 크롤링으로 좌표 알아내려 했으나 시간적 문제
# C:\Users\student\Desktop\Selenium>java -jar selenium-server-standalone-3.141.59.jar
# google spread sheet 기능 사용
remDr <- remoteDriver(remoteServerAddr="localhost",
                      port=4444,
                      browserName="chrome")
remDr
remDr$open()
remDr$navigate("http://www.dawuljuso.com/")

#remDr$getWindowHandles()
#remDr$getCurrentWindowHandle()
#remDr$switchToWindow("CDwindow-543C58C7CE595AFD263F35AABC309C1F")


inputBox<-remDr$findElement(using="css", "[id=input_juso]")


inputBox$sendKeysToElement(list("05512 서울특별시 송파구 한가람로20길 30 (풍납동) "))
btn <-remDr$findElement(using="css", 
                        "[id=btnSch]")
btn$clickElement()
li_element <- remDr$findElements(using="css",
                                 "[id=insert_data_5]")
myList <- sapply(li_element,function(x){x$getElementText()})
myList



# 관광 정보에 대한 엑셀 파일에 좌표 정보 join
# 고유 번호로 join
getwd()
location_info_1 = read_excel(path = "서울시_분류별_관광명소_좌표_(1).xlsx",
                            col_names = TRUE)
View(location_info_1)















library(RSelenium)
library(stringr)

remDr <<- remoteDriver(port =4444L,browser='chrome')



name=c('대구대','영남대','계명대')



geo_code=function(name,n=3){url='https://www.google.com/maps'
remDr$navigate(url)search=NULL
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







