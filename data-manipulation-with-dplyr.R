# load dplyr package
library("dplyr")

#read in the gapminder data
dat <- read.csv("data_R/gapminder_data.csv")

mean(dat$gdpPercap)
mean(dat[1:5, "gdpPercap"])
mean(dat[dat$continent == "Americas", "gdpPercap"])

#### using gplyr for data subsetting ----
# 'filter' chooses the rows #first is dataset, following comma all the conditions
filter(dat, continent == "Americas") 
filter(dat, year > 2000)
dat2 <- filter(dat, continent == "Americas", year > 2000)

# 'select' chooses the columns #first is dataset, following comma all the conditions
select(dat, continent)
select(dat2, country, year, gdpPercap) #chooses single columns in particular order

# %>% is the pipe that works the same as in unix shell. After pipe R knows that not ready, just hit "return"
dat %>%
  filter(continent == "Americas", year > 2000) %>%
  select(country, year, gdpPercap)

#### group_by() and summarize() ----
# do something with specific parts of dataset and summarize all of the calculations at the end
dat %>%
  group_by(country) %>% #split data by country and do following for each country
  summarize(avg_life_exp = mean(lifeExp))

#to safe output simewhere, assign a variable
summary_1 <- dat %>%
  group_by(country) %>% #split data by country and do following for each country
  summarize(avg_life_exp = mean(lifeExp))

#### Challenge Questions ----
# 1. Compute the average gdpPercap for each county
# 2. Compute the average gdpPercap for each continent in year 1957
# 1=
dat %>%
  group_by(country) %>%
  summarize(avg_gdp = mean(gdpPercap))

# 2= (version 1)
dat %>%
  group_by(continent) %>%
  filter(year == 1957) %>%
  summarize(avg_gdp = mean(gdpPercap))

# 2= (version 2)
dat %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(avg_gdp = mean(gdpPercap))
  
#### alternative ideas ----
dat %>%
  group_by(continent, year) %>% #this calculates for each year (results in 60 rows)
  summarize(avg_gdp = mean(gdpPercap))

dat %>%
  group_by(continent, year == 1957) %>% #this also lists all the continets without that year, listed as FALSE
  summarize(avg_gdp = mean(gdpPercap))
# Note that year == 1957 has to be double ==, otherwise creation of new variable

#### multiple summary outputs ----
dat %>%
  group_by(continent) %>% #
  summarize(avg_gdp = mean(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap),
            median_gdp = median(gdpPercap),
            sd_gdp = sd(gdpPercap),
            num_values = n()) #how much data was used in comparison

#### making new column variable ----
dat %>%
  mutate(gdp_billion = gdpPercap * 10^9)
       
#### wide vs long in gapminder data ----
dat2 <- dat %>%
  select(country, year, gdpPercap)

library(tidyr)
dat2_wide <- dat2 %>%
  spread(year, gdpPercap)

dat2_wide #double klick on the variable (right window) to display as table
#compare dat2 with dat2_wide to understand

dat2_wide2 <- dat2_wide %>%
  gather(year, gdp, "1952":"2007") #all of the columns between 1952 and 2007
#looks like dat2, but ordered by year and then country, dat2 is ordered the other way around
#look at data-import.pdf (cheatsheet)
