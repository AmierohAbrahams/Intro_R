# Day_1_recap.R
# This file is about reminding us of some tidyverse functions.
# # AJ Smit
# 20 February 2018


# Set-up ------------------------------------------------------------------

library(tidyverse)
# library(dplyr)
# library(readr)
# library(ggplot2)


# Load data ---------------------------------------------------------------

# loading data about the morphometric properties of the kelp, Laminaria pallida

laminaria <- read_csv("data/laminaria.csv")



# Which sites are available? ----------------------------------------------

unique(laminaria$site)


# Filter ------------------------------------------------------------------
out <- laminaria %>% 
  group_by(site) %>% 
  summarise(mn.bl.len = mean(blade_length),
            mn.bl.wt = mean(blade_weight),
            sd.bl.wt = sd(blade_weight))


sub2 <- pH %>% 
  group_by(Site) %>% 
  summarise(mn.pH = mean(pH, na.rm = TRUE),
            sd.pH = sd(pH, na.rm = TRUE))


ggplot(sub2, aes(x = Site, y = mn.pH)) +
  geom_col() +
  geom_errorbar(aes(ymin = mn.pH - sd.pH,
                    ymax = mn.pH + sd.pH),
                width=.1)
