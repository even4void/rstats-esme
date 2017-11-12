## Time-stamp: <2017-11-12 13:51:38 chl>

## R script to manage figures in 03-graphics.pdf

library(ggplot2)
library(ggthemes)
library(scales)
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
p <- p + geom_histogram(aes(y = ..density..), binwidth = 5, fill = "lightsteelblue", alpha = 0.7)
p <- p + geom_line(stat = "density", color = "steelblue", size = 1.3) + expand_limits(x = c(140, 220))
p <- p + scale_x_continuous(breaks = seq(140, 220, by = 10), limits = c(145, 205))
p + labs(y = "Density")
psave("fig_histodensity.png")


## Faceted histogram
p <- ggplot(data = crabs, aes(x = CL, y = CW, color = sp))
p <- p + geom_point(alpha = .7)
p <- p + facet_wrap(~ sex)
p + labs(x = "Carapace length (mm)", y = "Carapace width (mm)")
psave("fig_facetwrap.png")


## Boxplot
p <- ggplot(data = crabs, aes(x = sp, y = BD))
p <- p + geom_boxplot()
p + labs(x = "Species", y = "Body depth (mm)")
psave("fig_boxplot.png")


## Side by side boxplot after reshaping (1/3)
crabs.df <- reshape2::melt(crabs, measure.vars = 4:8)
p <- ggplot(data = crabs.df, aes(x = variable, y = value))
p <- p + geom_boxplot()
p + labs(x = "", y = "Measurement (mm)")
psave("fig_boxplot2.png")


## Side by side boxplot after reshaping (2/3)
p <- ggplot(data = crabs.df, aes(x = sp, y = value))
p <- p + geom_boxplot()
p <- p + facet_grid(~ variable)
p + labs(x = "", y = "Measurement (mm)")
psave("fig_boxplot3.png")


## Side by side boxplot after reshaping (3/3)
p <- ggplot(data = subset(crabs.df, variable != "BD"), aes(x = sp, y = value))
p <- p + geom_boxplot()
p <- p + facet_wrap(~ variable, nrow = 2, scales = "free")
p + labs(x = "", y = "Measurement (mm)")
psave("fig_boxplot4.png")


## Log 10 axes
## http://www.sthda.com/french/wiki/ggplot2-echelle-et-transformation-des-axes-logiciel-r-et-visualisation-de-donnees
p <- ggplot(data = Animals, aes(x = body, y = brain))
p <- p + geom_point()
p <- p + scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                       labels = trans_format("log10", math_format(10^.x)))
p <- p + scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                       labels = trans_format("log10", math_format(10^.x)))
p + annotation_logticks()
psave("fig_log10axis.png")


## Faceted histogram with custom colormap (1/2)
p <- ggplot(data = crabs, aes(x = CL, y = CW, color = sp))
p <- p + geom_point(alpha = .7)
p + scale_color_brewer()
p <- p + scale_color_manual("Species", values = c(grey(.3), "darkgoldenrod1"))
p <- p + facet_wrap(~ sex)
p + labs(x = "Carapace length (mm)", y = "Carapace width (mm)")
psave("fig_scalecolor.png")


## Faceted histogram with custom colormap (2/2)
p <- ggplot(data = crabs, aes(x = CL, y = CW, color = BD))
p <- p + geom_point()
p <- p + scale_color_distiller(palette = "OrRd")
p <- p + facet_grid(sp ~ sex)
p + labs(x = "Carapace length (mm)", y = "Carapace width (mm)")
psave("fig_scalecolor2.png")




