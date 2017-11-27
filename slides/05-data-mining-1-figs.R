## Time-stamp: <2017-11-27 17:30:08 chl>

## R script to manage figures in 05-data-mining-1.pdf

library(ggplot2)
library(ggthemes)


WD <- "~/git/rstats-esme/assets"
setwd(WD)

theme_set(theme_linedraw(base_family = "Fira Sans", base_size = 11))

psave <- function(filename = NULL, w = 4, h = w * 2/(1+sqrt(5)), r = 300, ...) {
  ggsave(filename = filename, width = w, height = h, dpi = r, ...)
}


moon <- read.table(file = "../data/toy_moons.txt", header = FALSE, sep = ",")

ggplot(data = moon, aes(x = V1, y = V2)) + geom_point()
psave("fig_toy-moon.png")

## Cluster analysis: euclidean distance, single and complete linkage
hc.s = hclust(dist(moon), method = 'single')
hc.c = hclust(dist(moon), method = 'complete')

moon$cl.s = factor(cutree(hc.s, k = 2))
moon$cl.c = factor(cutree(hc.c, k = 2))


ggplot(data = moon, aes(x = V1, y = V2)) + geom_point(aes(color = cl.s))
psave("fig_toy-moon-hcs.png", w = 3)

ggplot(data = moon, aes(x = V1, y = V2)) + geom_point(aes(color = cl.c))
psave("fig_toy-moon-hcc.png", w = 3)
