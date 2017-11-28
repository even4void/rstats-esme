## Time-stamp: <2017-11-28 11:18:10 chl>

##
## Illustration of bootstraped clustering
##

library(fpc)

## Toy dataset
sim.xy <- function(n, mean, sd)
	cbind(rnorm(n, mean[1], sd[1]),
        rnorm(n, mean[2],sd[2]))

dat <- rbind(sim.xy(100, c(0,0), c(.2,.2)),
             sim.xy(100, c(2.5,0), c(.4,.2)),
             sim.xy(100, c(1.25,.5), c(.3,.2)))

## Manual approach
n <- nrow(dat)
B <- 20
k <- seq(2, 20)
stat <- c("avg.silwidth", "g2", "g3", "pearsongamma", "dunn", "ch",
          "within.cluster.ss", "wb.ratio")
res.hc2 <- array(dim=c(B, length(k), length(stat)),
                 dimnames=list(1:B, k, stat))

for (b in 1:B) {
  cat("Iteration ", b, "\n")
  tmp <- dat[sample(1:n, n, replace = TRUE), ]
  dd <- dist(tmp)
  hc <- hclust(dd, method = "ward")
  for (i in k)
    res.hc2[b,i-1,] <- as.numeric(unlist(cluster.stats(dd, cutree(hc, i), G2 = TRUE, G3 = TRUE)[stat]))
}

## Automatic approach
hc.boot <- clusterboot(dist(xy), B = 20, bootmethod = "boot",
                       clustermethod = disthclustCBI, method = "ward", 
                       cut = "number", k = 3, showplots = TRUE)
