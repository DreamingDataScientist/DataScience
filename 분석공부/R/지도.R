#공간지도 - 지도에 통계관련 자료를 표시
head(accid_2015)

install.packages('ggmap')
install.packages('maps')
install.packages('mapproj')
library(ggmap)
library(maps)
library(mapproj)

#seoul <- get_googlemap('seoul', maptype='satellite')
#seoul <- ggmap(seoul)
#seoul

#seoul <- get_googlemap('seoul', maptype='hybrid')
#seoul <- ggmap(seoul)
#seoul

seoulmp <- get_googlemap('seoul', maptype='roadmap', zoom=1)
seoulmp <- ggmap(seoulmp)
seoulmp

ulsanmp <- get_googlemap('ulsan', maptype='satellite', zoom=15)
ulsanmp <- ggmap(ulsanmp)
ulsanmp

accid_2015_12 <- subset(accid_2015, 월==12)
head(accid_2015_12)

seoul_lat_lon <- read.csv('c:/Java/seoul_lat_lon.txt')
head(seoul_lat_lon)

#교통사고 파일과 구별 위치정보를 합침
accid_2015_12 <- merge(accid_2015_12, seoul_lat_lon, by.x='자치구명', by.y='area')

#맵에 자치구 위치를 점으로 표시
library(ggplot2)
seoul <- get_googlemap('seoul', maptype='roadmap', zoom=12)
geomp <- ggmap(seoul)
geomp <- geomp + geom_point(data=accid_2015_12, aes(x=lon, y=lat, size=발생건수), shape=17, color='blue', alpha=.5) 
geomp <- geomp + geom_text(data=accid_2015_12, aes(label=자치구명), size=3, hjust=1.2, fontface='bold')
geomp




