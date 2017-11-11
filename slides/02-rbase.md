---
title: R Basics
author: Christophe Lalanne
date: Fall 2017
---

# R and Data Science

## R

R est un langage versatile pour la manipulation et le traitement des données [@ihaka-1996-r]. C'est un logiciel open-source dérivé du langage S [@becker-1984-s], offrant à la fois un langage de programmation et des routines d'analyse statistiques puissantes. 

De nombreux packages, disponibles sur le site [CRAN][cran], fournissent des extensions aux fonctionnalités de base de R.

<http://r-project.org>

[cran]: http://cran.r-project.org

## RStudio

<http://rstudio.com>

![The RStudio "IDE"](../assets/img_rstudio.png)


## Data Science

![The Data Science Venn Diagram](../assets/img_datascience.png)

<http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram>


## Ressources internet

1. Matloff (2011). [The Art of R Programming](http://heather.cs.ucdavis.edu/~matloff/132/NSPpart.pdf). No Starch Press. 
2. Wickham & Grolemund (2015). [R for Data Science](http://adv-r.had.co.nz). [R4DS]
3. Hastie et al. (2009). [The Elements of Statistical Learning](http://statweb.stanford.edu/~tibs/ElemStatLearn/). Springer. 
4. James et al. (2015). [An Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/getbook.html). Springer. [ISLR]
5. Leskovec et al. (2011). [Mining of Massive Datasets](http://www.mmds.org). Cambridge University Press. 


# Les bases du langage R

## R comme calculateur

**R**ead **E**val **P**rint **L**oop

```r
> r <- 5
> 2 * pi * r^2
[1] 157.0796
```

Variable, constantes, opérateur, affectation, passage par valeur/référence...


## Aide en ligne

    > ?pi  ## help(pi)
    Constants                 package:base                 R Documentation
    
    Built-in Constants
    
    Description:
    
         Constants built into R.
    
    Usage:
    
         LETTERS
         letters
         month.abb
         month.name
         pi


## Packages

Packages de base : `stats`, `lattice`, `MASS`, ...

```r
library(MASS)
help(package = MASS)
data(package = MASS)
MASS::lm.ridge  # espace de nom
if (!require(dplyr))
  install.packages("dplyr", dependencies = TRUE)
```

[CRAN](http://cran.r-project.org) : liste des packages, Task Views, documentation.


## Script R

Plutôt que de saisir toutes les commandes dans la console, il est souvent plus judicieux d'enregistrer ses commandes dans un script R : simple fichier texte avec extension `.r` ou `.R`.

- construire une suite d'instructions réutilisables, modifiables et partageables
- fonctionnalités avancées pour l'interaction avec les scripts R dans RStudio


## Espace de travail

On distingue le répertoire courant de travail et l'espace de travail ou environnement.

```r
getwd()
setwd("~/Documents")
dir(pattern = ".R")
source("./monfichier.R")
ls()
```

RStudio fournit également des outils facilitant la gestion de l'espace de travail et la navigation dans le système de fichiers.


## Les objets R

L'élément de base est le vecteur que l'on peut créer avec la commande `c()`, entre autres, et dont les éléments sont de type :

- `numeric`, des nombres (entiers ou flottants)
- `logical`, des booléens à valeur dans {`TRUE`, `FALSE`}
- `character`, des caractères ASCII

## Variables et affectation

Les expressions suivantes sont valides :

```r
nombre <- 3.141593
v <- c(1,2,3,4)
b <- c(T,F,T,F)
s <- c("h","e","l","l","o")
a <- b <- rnorm(2)
b -> u
```


## Adresser les éléments d'un vecteur

On utilise `[` pour indexer les n éléments d'un vecteur, sachant que l'index du premier élément vaut 1 (et non 0 comme dans certains langages) :

```r
v[1]
v[c(1,4)]
v[1:4]
```

## Adresser les éléments d'un vecteur (con't)

On peut adresser les élements d'un vecteur en utilisant les valeurs contenues dans un autre vecteur (principe d'un dictionnaire ou table de hachage), par exemple :

```r
v <- c(1,2,3,4)
b <- c(T,F,T,F)
s <- c("h","e","l","l","o")
v[b]    # valeurs de v telles que b vaut TRUE
s[v[2]] # v[2]=2, d'où s[2] qui vaut "e"
```

## Illustration

```r
x <- c(1,4,10,3,1)
names(x) <- letters[1:length(x)]
idx <- c(1,3,4)
g <- c(T,F,T,T,F)
```

##  

![Représentation schématique d'un vecteur](../assets/img_vectors.png)

Sélection indexée des éléments de `x` :

```r
x[idx]
x[g]
```

## Trier, classer

On peut également effectuer des opérations de tri sur un vecteur :

```r
x <- 1:10
xs <- sample(x)
sort(xs, decreasing = TRUE)
order(xs)
```

ou obtenir le rang de ses élements

```r
rank(rev(xs))
```

## Nombres aléatoires

Dès que l'on manipule des nombres aléatoires, il est nécessaire de fixer la graine du générateur congruentiel (`set.seed()`), autrement on ne pourra pas reproduire la séquence (e.g., cas des simulations). 

```r
> runif(4)
[1] 0.1791854 0.7889672 0.8164497 0.2004527
> runif(4)
[1] 0.80375195 0.01630027 0.45203035 0.58823877
```

    % Rscript -e "print(runif(4))"
    [1] 0.44252118 0.61164540 0.24009883 0.01861185
    % Rscript -e "print(runif(4))"
    [1] 0.04160656 0.42925736 0.89571922 0.62046257
    % Rscript -e "set.seed(101); print(runif(4))"
    [1] 0.37219838 0.04382482 0.70968402 0.65769040


## Lois de probabilité et distributions

    r* random variate 
    q* quantile
    p* probability
    d* density
    
    
- *norm : loi normale $\mathcal{N}(\mu, \sigma)$, paramètres `mu =` et `sd =`
- *binom : loi binomiale $\mathcal{B}(n, p)$, paramètres `n =` et `prob =`
- *unif : loi uniforme $\mathcal{U}(a, b)$, paramètres `min =` et `max =`

Exemple : `rbinom(n = 10, size = 1, prob = 0.5)`

# Génération de séquences

## Séquence régulière d'entiers

```r
c(1, 2, 3, 4, 5)
1:10
2:5
```

L'opérateur `:` repose en fait sur la fonction `seq()` :

```r
seq(1, 10)
seq(1, 10, by = 2)
seq(0, by = .1, length = 11)
```

## Séquence et répétition

```r
x = c(1, 3, 5)
seq(along = x)
```

```r
rep(x, 2)
rep(x, each = 2)
```

## Permutation et tirage avec remise

```r
x = 1:10
sample(x)
```

Tirage sans remise et combinaisons :
```r
sample(x, 3)
combn(x, 3)
```

Tirage avec remise (bootstrap) :
```r
sample(c(0,1), 10, replace = TRUE)
```


# Objets structurés

## Matrice

Collection de valeurs de même type (e.g., nombres ou caractères) arrangées dans une structure à deux dimensions (`array`, n-dimensions).

```r
x <- c(1,4,10,3,1)
y <- c(2,7,1,5,3)
cbind(x, y)
rbind(x, y)
```

## Illustration

![Représentation schématique d'une matrice](../assets/img_rbind.png)

## Liste

Collection de valeurs de différents types, de taille éventuellement variable.

```r
x <- c(1,4,10,3,1)
y <- c("a", "b", "c")
z <- list(alpha = x, beta = y)
```

```r
> str(z)
List of 2
 $ alpha: num [1:5] 1 4 10 3 1
 $ beta : chr [1:3] "a" "b" "c"
```


# Structures de contrôle et programmation R


## Branchement conditionnel (If-else)

```r
test <- TRUE
if (test) print("Hello") else print("Bye-bye")
```

La dernière expression (*) est vectorisée :

```r
n <- 20
x <- sample(letters[1:3], n, rep = TRUE)
y <- sample(1:100, n)
z <- ifelse(x == "a", 1, 0)   ## (*)
```


## Itération (for)

```r
s <- 0
for (i in 1:10) {
	s <- s+i
}
```

En plus simple :

```r
cumsum(1:10)
```

## Commandes *apply

Souvent, on peut exploiter les fonctions de la [famille `*apply()`][apply] :

```r
val <- c(2, 8, 3, 4)
f <- function(x) x+2
res <- numeric(4)
for (i in 1:4) res[i] <- f(val[i])
```

En plus simple :

```r
sapply(val, f)
```

[apply]: https://stackoverflow.com/q/3505701

## Fonctions

Comme dans d'autres langages de programmation, une fonction accepte des arguments.

    f <- function(x, y = NULL, ...) {
      ...
      return(val)
    }

```r
> args(sapply)
function (X, FUN, ..., simplify = TRUE,
          USE.NAMES = TRUE)
NULL
```

## Application

```r
f <- function(x) mean(x)
v <- sample(1:100, 10)
f(v)
```

Ajout de paramètres avec valeur par défaut :

```r
f <- function(x, na.rm = FALSE)
  mean(x, na.rm = na.rm)
v[sample(1:length(v), 5)] <- NA
f(v)  ## na.rm = FALSE
f(v, na.rm = TRUE)
```


## References
