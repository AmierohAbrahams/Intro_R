# Day_1.R
# Here we are going to practise some things taught to us on Day1
# Amieroh
#2018/02/20


# use ctrl shift R to do this heading
# Making a basic graph ----------------------------------------------------

# cntrl S to save 


# na.rm(optional data usages, if there is a missing value)
# library(tidyverse)
x <- seq(0, 2, by = 0.01)
y <- 2 * sin(2 * pi * (x - 1/4))
ggplot() + # make the plot
  geom_point(aes(x = x, y = y), shape = 21, col = "salmon", fill = "white")



# Read in data ------------------------------------------------------------

# read in data that were exported as .csv from Excel
library(readr)
read.csv2("data/laminaria.csv")
laminaria <- read_csv2("data/laminaria.csv")


# Exploring the data ------------------------------------------------------

#option1 for looking at data:
laminaria

#option 2: use the environment pane
# click the interface

#option 3:
head(laminaria)
head(laminaria, n = 2)
tail(laminaria)

#option 4
names(laminaria)
things <- names(laminaria)
row.names(laminaria)
colnames(laminaria)

#option 5
summary(laminaria)
mean(laminaria$blade_weight)
sd(laminaria$blade_weight)
median(laminaria$blade_weight)
min(laminaria$blade_weight)
max(laminaria$blade_weight)
range(laminaria$blade_weight)



# The tidyverse -----------------------------------------------------------

laminaria %>% 
  selecct(site,total_length)
laminaria %>%  
  select(site, total_length)
laminaria %>% 
  select(site,total_length) %>% 
  filter(site == "Kommetjie")

laminaria %>% 
  filter(total_length == max(total_length))


# which sites are available? ----------------------------------------------

unique(laminaria$site)




# Filter ------------------------------------------------------------------
out <- laminaria %>% 
  group_by(site) %>% 
  summarise(mn.bl.len = mean(blade_length),
            mn.bl.wt = mean(blade_weight),
            sd.bl.wt = sd(blade_weight))
summary(out)

# Getting into graphs -----------------------------------------------------

library(ggplot2)
ChickWeight <- datasets::ChickWeight
#cntrl l
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_point() +
  geom_line(aes(group = Chick))

ggplot(ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  #geom_line(aes(group = Chick)) +
  geom_smooth(method = "lm")
