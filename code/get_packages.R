## Time-stamp: <2017-11-07 09:55:08 chl>

##
## Download R packages.
##

packages = c("tidyverse", "data.table", "ggplot2", "leaflet")
packages = lapply(packages, FUN = function(x) {
  if(!require(x, character.only = TRUE)) {
    install.packages(x)
    library(x, character.only = TRUE)
  }
})
