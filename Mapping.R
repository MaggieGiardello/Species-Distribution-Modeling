data <- read.csv("data/cleanData.csv")

install.packages("webshot2")

library(leaflet)
library(mapview)
library(webshot2)

map <- leaflet() |>
  addProviderTiles("Esri.WorldTopoMap")|>
  addCircleMarkers(data= data,
                   lat= ~decimalLatitude,
                   lng= ~decimalLongitude,
                   radius= 3,
                   color= "maroon",
                   fillOpacity = 0.8)|>
  addLegend(position= "topright",
            title= "Species Occurences from GBIF",
            labels= "Habronattus americanus",
            colors= "maroon",
            opacity= 0)

#save the map 
mapshot2(map, file= "output/leafletTest.png")
