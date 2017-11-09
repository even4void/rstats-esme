## Time-stamp: <2017-11-09 18:50:17 chl>

## R script to manage figures in 03-graphics.pdf

library(ggplot2)
library(ggthemes)
library(MASS)

## Simple scatterplot with lowess smoother
p <- ggplot(data = birthwt, aes(x = lwt, y = bwt))
p <- p + geom_point() + geom_smooth(method = "auto")
p + theme_igray(base_family = "Fira Sans", base_size = 12)
ggsave("~/git/rstats-esme/assets/fig_layer.png",
       width = 4, height = 4*0.618, dpi = 300, bg = "transparent")
