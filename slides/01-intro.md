---
title: Introduction
author: Christophe Lalanne
date: Fall 2017
---

# Overview

## Organization

Lectures are scheduled each Tuesday, starting November, 7th. 

This will be a mix of R programming and statistical modeling, ranging from data crunching to data mining and machine learning.

- Nov, 7: R basics
- Nov, 14: Graphics with `ggplot2`
- Nov, 15*: R dplyr, database connection
- Nov, 28: Statistical modeling in R
- Nov, 5: 
- Nov, 12: Reporting with R Markdown and Shiny
- Nov, 19: Final project

## Synopsis

R programming, statistical methods, hand-on practicals

## Practicals

R Markdown report

## Assessment

Combined use of practicals (20%), intermediate project (40%) and final assessment (40%).

# Tools

## Ressources

Ressources are available in the following Git-versioned repository:  
<center> <https://bitbucket.org/chlalanne/rstats-esme> </center>

You can fork the repository using `http` or `ssh` (`git@bitbucket.org:chlalanne/rstats-esme.git`) and keep posted with `git pull`. You can submit PRs if you like but please, don't push anything in the main repository. 

## Additional tools

- [R][R] and [Rstudio][Rstudio]
- Some R packages (and their dependencies which shall be installed automatically): [tidyverse][tidyverse], [ggplot2][ggplot2], [data.table][data.table], [leaflet][leaflet], ... 
- "R for Data Science" book [@wickham-2017-r-data-scien], (maybe) "Advanced R" [@wickham-2014-advan-r]

The following command will download required packages for you:

```r
source("get_packages.R")
```

Eventually, you may want to install Git on your local machine, as well as a good text editor (other than Notepad).[^1]

[^1]: I will not be of any help in case you are running Windows on your computer.[^2]

[R]: http://cran.r-project.org
[Rstudio]: http://rstudio.com
[tidyverse]: http://tidyverse.org
[ggplot2]: http://ggplot2.org
[data.table]: https://github.com/Rdatatable/data.table/wiki
[leaflet]: https://rstudio.github.io/leaflet/


## References

