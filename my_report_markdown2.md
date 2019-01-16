gapminder-report
================
Fritzi
January 16, 2019

The output file can also be in github format. Choose output: github\_document

Load the data, insert R chunk using ctrl alt i
==============================================

First, we are going to use read.csv to load the gapminder data.

``` r
dat <- read.csv("data_R/gapminder_data.csv")
summary(dat)
```

    ##         country          year           pop               continent  
    ##  Afghanistan:  12   Min.   :1952   Min.   :6.001e+04   Africa  :624  
    ##  Albania    :  12   1st Qu.:1966   1st Qu.:2.794e+06   Americas:300  
    ##  Algeria    :  12   Median :1980   Median :7.024e+06   Asia    :396  
    ##  Angola     :  12   Mean   :1980   Mean   :2.960e+07   Europe  :360  
    ##  Argentina  :  12   3rd Qu.:1993   3rd Qu.:1.959e+07   Oceania : 24  
    ##  Australia  :  12   Max.   :2007   Max.   :1.319e+09                 
    ##  (Other)    :1632                                                    
    ##     lifeExp        gdpPercap       
    ##  Min.   :23.60   Min.   :   241.2  
    ##  1st Qu.:48.20   1st Qu.:  1202.1  
    ##  Median :60.71   Median :  3531.8  
    ##  Mean   :59.47   Mean   :  7215.3  
    ##  3rd Qu.:70.85   3rd Qu.:  9325.5  
    ##  Max.   :82.60   Max.   :113523.1  
    ## 

Plot data
=========

Setup
-----

We need to load the ggplot2 package

``` r
library(ggplot2)
```

Plotting
--------

``` r
ggplot(data = dat,
       mapping = aes(x = year,
                     y = lifeExp,
                     by = country,
                     color = continent)) +
  facet_wrap(~ continent) +
  geom_line() +
  theme_bw()
```

![](my_report_markdown2_files/figure-markdown_github/unnamed-chunk-3-1.png)

Insert premade figure
---------------------

We have a figure at "figures/life\_exp.png". How do we insert it into our report?

``` r
knitr::include_graphics("figures/life_exp.png")
```

![Life expectancy vs, Year, for each country facetted by continent](figures/life_exp.png)
