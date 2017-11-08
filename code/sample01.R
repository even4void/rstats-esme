## Time-stamp: <2017-11-08 10:33:36 chl>

##
## Sample script for session #1.
##

## Create a single vector with 5 numeric elements
v <-  c(1, 1, 2, 3, 5)

## Display its content
v
print(v)

## Generate a random permutation of the first 10 integers
sample(1:10)

## or a list of integers
sample(c(1,2,3,4,5,6))

## Sample with replacement
sample(c(0,1), 5, replace = TRUE)

## Names vectors
v <-  c(a = 1, b = 1, c = 2, d = 3, e = 5)

## Set the seed so that random numbers are "reproducible"
set.seed(101)

## Generate 10 gaussian variates
rnorm(10)
rnorm(20)

## Create a matrix with 2 columns and query its dimensions
## and content
x <- sample(seq(1, 10))
y <- sample(seq(1, 10))

xy <- cbind(x, y)

dim(xy)

xy[2,2]
xy[3:6,1]

## Access part of an object based on logical expressions
## and use if/else branching
x <- runif(100, 0, 1)

x[seq(1, 10, by = 2)]

x[x > 0.5]

if (x[1] > 0.5) print("OK") else print("x <= 0.5")

ifelse(x[1:10] > 0.5, "ok", "pas ok")

## Play with for loop
s <- 0
for (i in 1:10)
  s <-  s + i

s

s <- 0
for (i in c(1,3,5))
  s <-  s + i

## Create a custom function that wraps up the for loop
f <- function(n, s = 0) {
  for (i in 1:n)
    s <- s + i
  return(s)
}

f(10)
