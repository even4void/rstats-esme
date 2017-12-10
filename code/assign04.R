## Time-stamp: <2017-12-04 12:59:00 chl>

##
## Placeholder for assignment #4.
##

data(MovieLense, package = "recommenderlab")
d = getData.frame(MovieLense)

library(data.table)
dt = data.table(d)
setorder(dt, item)

## 1. À partir des données MovieLense (package {recommenderlab}), trouver des films
## visionnés par au moins 10 personnes. Quelles sont les notes attribuées à ces films ?

dt[, length(rating), by = "item"]

## 2. Comment se comparent les résultats des méthodes `IBCF` et `UBCF`
## (en termes de prédiction pour l'utilisateur 926) ?

## 3. Que recommenderiez-vous à une personne ayant aimé Star Wars ?

dt[item == "Star Wars (1977)" & rating >= 4]
p = predict(res, 1, data = MovieLense, n = 1)
as(p, "list")
