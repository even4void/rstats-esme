## Time-stamp: <2017-11-15 16:06:57 chl>

##
## Placeholder for assignment #3.
##

library(data.table)
library(ggplot2)
library(ggmap)

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



## 3. Représenter la distribution des stations par arrondissemnt.


## 4. Représenter la position géographique des stations Velib dans Paris
## (`ggmap::get_map(location = c(2.3, 48.9), zoom = 12)`).

