## Time-stamp: <2017-11-14 14:45:53 chl>

##
## Placeholder for assignment #1.
##

set.seed(101)

## 1. Générer une séquence de n événements 0/1, avec p = 0,5.
foo <- function(n) sample(c(0,1), n, replace = TRUE)

## foo <- function(n) ifelse(runif(n, 0, 1) > 0.5, 1, 0)
## rbinom(n = 10, size = 1, prob = 0.5)

foo(10)

## 2a. Calculer la proportion de résultats positifs obtenus en (1).
## 2b. Faire varier n, n = {10, 100, 1000, 1e4, 1e6}
x <- foo(10)
sum(x) / length(x)
mean(x)

n <- c(10, 100, 1000, 1e4, 1e6)
r <- numeric(length(n))

for (i in 1:length(n)) {
  r[i] <- mean(foo(n[i]))
}


## 3. Répéter l'expérience m = 1000 fois, avec n fixé à 100, et vérifier
## la distribution des proportions observées.
n = 100   ## taille échantillon
m = 1000  ## nb expériences
r = numeric(m)

for (i in 1:m) {
  r[i] <- mean(foo(n))
}

hist(r, breaks = 15)


## 4a. Quel est le 1er événement positif pour une expérience ?
## 4b. En moyenne pour m = 1000 expériences ?
x = foo(20)
which(x == 1)[1]
