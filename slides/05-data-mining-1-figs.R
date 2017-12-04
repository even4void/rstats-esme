## Time-stamp: <2017-12-04 11:57:16 chl>

## R script to manage figures in 05-data-mining-1.pdf

library(ggplot2)
library(ggthemes)
library(ggfortify)
library(colorspace)
library(viridis)
library(gridExtra)
library(mclust)
library(arulesViz)
library(recommenderlab)


WD <- "~/git/rstats-esme/assets"
setwd(WD)

theme_set(theme_linedraw(base_family = "Fira Sans", base_size = 11))

clr2 <- rainbow_hcl(n = 2)
clr3 <- rainbow_hcl(n = 3)

psave <- function(filename = NULL, w = 4, h = w * 2/(1+sqrt(5)), r = 300, ...) {
  ggsave(filename = filename, width = w, height = h, dpi = r, ...)
}

moon <- read.table(file = "../data/toy_moons.txt", header = FALSE, sep = ",")

ggplot(data = moon, aes(x = V1, y = V2)) + geom_point()
psave("fig_toy-moon.png")

## Cluster analysis: euclidean distance, single and complete linkage
hc.s <- hclust(dist(moon), method = 'single')
hc.c <- hclust(dist(moon), method = 'complete')

moon$cl.s <- factor(cutree(hc.s, k = 2))
moon$cl.c <- factor(cutree(hc.c, k = 2))

p1 <- ggplot(data = moon, aes(x = V1, y = V2)) +
  geom_point(aes(color = cl.s)) +
  scale_color_manual(values = clr2, guide = FALSE) +
  labs(x = "", y = "", caption = "Single linkage")
p2 <- ggplot(data = moon, aes(x = V1, y = V2)) +
  geom_point(aes(color = cl.c)) +
  scale_color_manual(values = clr2, guide = FALSE) +
  labs(x = "", y = "", caption = "Complete linkage")
p <- grid.arrange(p1, p2, ncol = 2)
psave("fig_toy-moon-hc.png", plot = p, w = 5)


km <- kmeans(moon, centers = 2, nstart = 25)
mc <- Mclust(moon, G = 2)

moon$cl.km <- factor(km$cluster)
moon$cl.mc <- factor(mc$classification)

p1 <- ggplot(data = moon, aes(x = V1, y = V2)) +
  geom_point(aes(color = cl.km)) +
  scale_color_manual(values = clr2, guide = FALSE) +
  labs(x = "", y = "", caption = "K-Means")
p2 <- ggplot(data = moon, aes(x = V1, y = V2)) +
  geom_point(aes(color = cl.mc)) +
  scale_color_manual(values = clr2, guide = FALSE) +
  labs(x = "", y = "", caption = "Model-based (Mclust 5.4)")
p <- grid.arrange(p1, p2, ncol = 2)
psave("fig_toy-moon-km.png", plot = p, w = 5)



## p <- factoextra::fviz_cluster(km, data = moon[,1:2], palette = clr2, ellipse.type = "norm", geom = "point")
## p + theme_linedraw(base_family = "Fira Sans", base_size = 11)


w = read.table(file = "../data/wine.csv", sep = ",")

names(w) <- c("Type","Alcohol","Malic","Ash","Alcalinity",
              "Magnesium","Phenols","Flavanoids","Nonflavanoids",
              "Proanthocyanins","Color","Hue","Dilution","Proline")
w$Type <- factor(w$Type)
pca <- prcomp(w[,-1], center = TRUE, scale = TRUE)

autoplot(pca, data = w, colour = "Type", loadings = TRUE, loadings.colour = grey(.7)) +
  scale_color_manual(values = clr3) +
  guides(color = FALSE)
psave("fig_pca-wine.png")



data(Groceries)

rules = apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5))

d = rules@quality

ggplot(data = d, aes(x = support, y = confidence, color = lift)) +
  geom_point() +
  scale_color_viridis(direction = -1)

psave("fig_arules-groceries.png")


data(MovieLense)

d <- getData.frame(MovieLense)

r <- getRatings(normalize(MovieLense, method = "Z-score"))

qplot(r, xlab = "Z-score", ylab = "Frequency")
psave("fig_zscore-movielense.png")
