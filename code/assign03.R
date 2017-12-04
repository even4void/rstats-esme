## Time-stamp: <2017-12-04 13:19:31 chl>

##
## Placeholder for assignment #3.
##

library(data.table)
library(ggplot2)
library(ggmap)
library(stringr)

## 1. Avec les données beer_reviews.csv, afficher simultanément les évaluations
## portant sur les critères d'arôme et d'apparence dans le même graphique.

dt = fread("data/beer_reviews.csv")
r = dt[, .(mean(review_aroma), mean(review_appearance)), by = beer_style]
names(r) = c("style", "aroma", "appearance")

r = reshape2::melt(r, measure.vars=2:3)

p = ggplot(data = subset(r, value > 3.9), aes(x = reorder(style, value), y = value, color = variable))
p = p + geom_point() + scale_color_manual("", values = c("darkgoldenrod1", "grey50"))
p + coord_flip() + labs(x = "", y = "Rating") + theme_minimal()

## 2a. Télécharger les données Velib sur le site Open Data Paris au format CSV.
## (http://opendata.paris.fr/explore/dataset/stations-velib-disponibilites-en-temps-reel/export/)
## 2b. géolocaliser les 10 premières station avec `ggmap::geocode()`.

baseurl = "http://opendata.paris.fr/explore/dataset/stations-velib-disponibilites-en-temps-reel/export/"

f = "stations-velib-disponibilites-en-temps-reel.csv"
d = read.csv2(paste("data", f, sep = "/"))

first10 = as.character(d$address[1:10])
first10 = tolower(gsub("-", "", first10))
geocode(first10)

## 3. Représenter la distribution des stations par arrondissemnt.

parse_coords = function(x)
  as.numeric(unlist(strsplit(as.character(x), ",")))

arrdt = as.numeric(unlist(str_extract_all(d$address, "[0-9]{5}")))

tmp = parse_coords(d[,"position"])

geodb = data.frame(id = d$number,
                   arrdt = arrdt,
                   lat = tmp[seq(1, length(tmp), by = 2)],
                   lon = tmp[seq(2, length(tmp), by = 2)])

geodb = subset(geodb, substr(arrdt, 1, 2) == 75)
geodb$code = factor(substr(geodb$arrdt, 4,5))

table(geodb$code)

## 4. Représenter la position géographique des stations Velib dans Paris
## (`ggmap::get_map(location = c(2.3, 48.9), zoom = 12)`).

hdf = get_map(location = c(2.35, 48.85), zoom = 12)

p = ggmap(hdf, extent = "device")
p = p + geom_point(data = geodb, aes(x = lon, y = lat, colour = code),
                   alpha=.5, size = 1)
p

library(leaflet)

IDFmap = leaflet() %>%
  addTiles() %>%
  setView(2.35, 48.85, zoom = 12) %>%
  addCircleMarkers(geodb$lon, geodb$lat,
                   radius = 1,
                   clusterOptions = markerClusterOptions())

IDFmap
