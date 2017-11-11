## Time-stamp: <2017-11-09 21:06:33 chl>

## R script to manage figures in 03-graphics.pdf

library(ggplot2)
library(ggthemes)
library(MASS)

WD <- "~/git/rstats-esme/assets"
setwd(WD)

theme_set(theme_linedraw(base_family = "Fira Sans", base_size = 11))

psave <- function(filename = NULL, w = 4, h = 4 * 2/(1+sqrt(5)), r = 300, ...) {
  ggsave(filename = filename, width = w, height = h, dpi = r, ...)
}

## Simple scatterplot with lowess smoother
p <- ggplot(data = birthwt, aes(x = lwt, y = bwt))
p <- p + geom_point() + geom_smooth(method = "auto", se = FALSE, color = grey(.3))
p <- p + theme_igray(base_family = "Fira Sans", base_size = 12)
ggsave("fig_layer.png", plot = p, width = 4, height = 4*0.618)


## Sample histogram
p <- ggplot(data = survey, aes(x = Height))
p + geom_histogram(binwidth = 5)
psave("fig_histogram.png")


## Sample histogram
p <- ggplot(data = survey, aes(x = Height))
p + geom_density(adjust = 0.8, fill = "lightsteelblue", color = "transparent", alpha = 0.7)
psave("fig_density.png")


## Sample histogram with some enhancement
p <- ggplot(data = survey, aes(x = Height))
p <- p + geom_histogram(aes(y=..density..), binwidth = 5, fill = "lightsteelblue", alpha = 0.7)
p <- p + geom_line(stat = "density", color = "steelblue", size = 1.3) + expand_limits(x = c(140, 220))
p <- p + scale_x_continuous(breaks = seq(140, 220, by = 10), limits = c(145, 205))
p + labs(y = "Density")
psave("fig_histodensity.png")
