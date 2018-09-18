# Day_3.R
# Amieroh
# 2018/02/21


# Loading the data --------------------------------------------------------
library(tidyverse)
library(ggplot2)

# Load the data -----------------------------------------------------------
# Make a graph ------------------------------------------------------------

Chicks <- datasets::ChicksWeight

ggplot(data = Chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~Diet, ncol = 2) +
  labs(x = "Days", y = "Mass (g)")
 # to increase the thickness add size= 2 (or whatever value)

ggplot(data = Chicks, aes(x = Time, y = weight)) +
  geom_point(aes(colour = Diet)) +
  geom_line(aes(group = Chick), colour = "lightyellow2", alpha = 0.9) +
  geom_smooth(method = "lm", aes(colour = Diet))

# changing the shape of points

ggplot(data = Chicks, aes(x = Time, y = weight)) +
  geom_point(shape =24, colour = "Salmon", fill = "yellow") +
  geom_line(aes(group = Chick), colour = "lightyellow2", alpha = 0.9) +
  geom_smooth(method = "lm", aes(colour = Diet))

#change the size of the symbol

ggplot(data = Chicks, aes(x = Time, y = weight)) +
  geom_point(shape =24, colour = "Salmon", fill = "yellow", size = 5) +
  geom_line(aes(group = Chick), colour = "lightyellow2", alpha = 0.9) +
  geom_smooth(method = "lm", aes(colour = Diet))

# change the theme

ggplot(data = Chicks, aes(x = Time, y = weight)) +
  geom_point(shape =24, colour = "Salmon", fill = "yellow", size = 5) +
  geom_line(aes(group = Chick), colour = "lightyellow2", alpha = 0.9) +
  geom_smooth(method = "lm", aes(colour = Diet)) +
  theme_bw()
 
#change the labels

ggplot(data = Chicks, aes(x = Time, y = weight)) +
  geom_point(shape =24, colour = "Salmon", fill = "yellow", size = 5) +
  geom_line(aes(group = Chick), colour = "lightyellow2", alpha = 0.9) +
  geom_smooth(method = "lm", aes(colour = Diet)) +
  labs(x = "Time (days)", y = "mass (g)") +
  theme_bw()


# Continue ----------------------------------------------------------------

library(ggpubr)






