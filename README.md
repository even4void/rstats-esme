# Repository for ESME #rstats course

You landed on the README page...

This repository included various pieces of R code and Markdown documents that will be used during the course. Of particular interest, there are the [slides][slides] and [code][code] that hold relevant parts of the on-line course. Slides are available in PDF and Markdown format. The latter can be displayed on-line on Bitbucket. The PDF slides are rendered using [Pandoc][pandoc] + LaTeX (see the `Makefile`).

You can clone this repository on your personal computer using, e.g.:

    git clone https://chlalanne@bitbucket.org/chlalanne/rstats-esme.git

[slides]: https://bitbucket.org/chlalanne/rstats-esme/src/master/slides
[code]: https://bitbucket.org/chlalanne/rstats-esme/src/master/code
[pandoc]: https://pandoc.org

## Syllabus

Here is a temptative schedule, but see the [course overview][overview]:

1. Nov, 7: R basics
2. Nov, 14: Graphics with `ggplot2`
3. Nov, 15*: R dplyr and data.table 
4. Nov, 28: R and database, data mining
5. Dec, 5: Statistical modeling in R
6. Dec, 12: Reporting with R Markdown and Shiny
7. Dec, 19: Final project

Each session will run for 3 hours, including a 1-hour hand-on practical. Solutions will be available in the [code][code] folder. Additional lectures are listed below.

- Nov, 14-15: ISLR §2.1 and R4DS §3 and §7
- Nov, 28: ISLR §10.2-10.3 and R4DS §13
- Dec, 5: ISLR §3.6, 5.1-5.2 and R4DS §23-25
- Dec, 12: R4DS §27
- Dec, 19: ISLR §8.2, 9.2-9.3

R4DS = [R for Data Science][r4ds]
ISLR = [Introduction to Statistical Learning][islr]

[r4ds]: http://r4ds.had.co.nz
[islr]: http://www-bcf.usc.edu/~gareth/ISL/
[overview]: https://bitbucket.org/chlalanne/rstats-esme/src/master/slides/01-intro.md

## Software

- [R][cran] and [Rstudio][rstudio]
- a decent text editor (Emacs, Vi(m), Sublime, Atom, VS Code)
- [Git][git]

[cran]: http://cran.r-project.org
[rstudio]: http://rstudio.com
[git]: https://git-scm.com

## Final assessment

In addition to the two practicals, there is a final evaluation.

### Project (3CI)

The project will consist in developing a recommender system based on a small to moderate dataset. You will have to compute custom numerical weights based either on text-based user review or numerical ratings, then apply an UCBF evaluation scheme and assess the predictive ability of the model. The dataset and detailed instructions will be uploaded soon.

### Exam (3CB)

The on-site assessment will last 2 hours. You are allowed to use any document, including the slides and PDFs listed on this page. The exam will consist in a series of questions including: review of R code, small numerical applications (no calculator required), and general questions about the content of the course itself as well as R4DS and ISLR textbooks, and chapters recommended for the "data mining" slides (5 & 6).