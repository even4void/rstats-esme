---
title: Graphics in R
author: Christophe Lalanne
date: Fall 2017
---

# Les différents systèmes graphiques


# Le package ggplot2


## Un concept de couches

![](../assets/img_layers.png)

<https://roadtolarissa.com/hurricane/>


## Illustration

```r
p = ggplot() +
    layer(data = MASS::birthwt,
          stat = "identity",
          geom = "point",
          mapping = aes(x = lwt, y = bwt),
          position = "identity") +
    layer(data = MASS::birthwt,
          stat = "smooth",
          geom = "line",
          mapping = aes(x = lwt, y = bwt),
          position = "identity",
          params = list(method = "auto"))      
```

## Illustration (con't)

![](../assets/fig_layer.png)

## Illustration (con't)

Formulation équivalente :

```r
library(MASS)
p = ggplot(data = birthwt, aes(x = lwt, y = bwt))
p + geom_point() + geom_smooth(method = "auto")
```

## Histogramme d'effectifs

```r
p = ggplot(data = ToothGrowth, aes(x = len))
p + geom_histogram(binwidth = 5)
```

# Paramètres avancés


# Visualisation de données spatiales


# Visualisation de données temporelles



## References
