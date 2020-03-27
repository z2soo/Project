time_input <- 30 # 예시
# 위도로 변환하기 
long_lati_diff = (0.001365 * time_input) + 0.002378
map_diff = long_lati_diff/sqrt(2)
df_exp  <- as.data.frame(df_exp)

dep_lat <- 37.472 #위도
dep_long <- 127.051338
df_exp$Longitude
df_exp$상호명

trial1=df_exp$Latitude>=dep_lat-map_diff
trial2=df_exp$Latitude<=dep_lat+map_diff
trial3 = df_exp$Longitude>=dep_long -map_diff
table(trial3)
df_exp[trial1]
length(trial1)
result <- df_exp %>% filter(Latitude>=dep_lat-map_diff &Latitude<=dep_lat+map_diff)%>% filter(Longitude>=dep_long-map_diff & Longitude<=dep_long+map_diff)%>% select(상호명,Longitude,Latitude)

time_diff <-  (sqrt((result[,"Longitude"]-dep_long)**2+(result[,"Latitude"]-dep_lat)**2)-0.002378)/0.001365

final_result <- cbind(result,time_diff)

