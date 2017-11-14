## Time-stamp: <2017-11-14 18:53:55 chl>

##
## Placeholder for assignment #2.
##

library(ggplot2)

## 1. Central Limit Theorem
## See (3) in assign01.R
## Draw an histogram + a kernel density estimate of the proportion
## estimated on 1000 draws of a binomial experiment where n = 30.
source("assign01.R")

p = ggplot(mapping = aes(x = r))
p + geom_histogram()

## 2. Use of small multiples with time series
## Reproduce this figure : code/sample01.png
data(AirPassengers)
d <- data.frame(Year = c(floor(time(AirPassengers) + .01)),
                Month = c(cycle(AirPassengers)),
                Value = c(AirPassengers))
d$Month <- factor(d$Month)
levels(d$Month) <- month.abb

tmp = d
names(tmp)[2] = "MMonth"

p = ggplot(data = d)
p = p + facet_wrap(~ Month, nrow = 3)
p = p + geom_line(data = tmp, aes(x = Year, y = Value, group = MMonth), color = grey(.7))
p = p + geom_line(aes(x = Year, y = Value), size = 1.5)
p + theme_minimal()


## 3. Use of stat_smooth
## Using the birthwt dataset, draw a facetted scatterplot (facet = race) and
## display the same overall regression line in each facet.
