# Day_5
# New data set
#Intention?aim/objection: To undertake Assigmenet 1
#Amieroh
#2018/02/23


# Setup -------------------------------------------------------------------

library(tidyverse)


#  Loading the data -------------------------------------------------------

dat1 <- iris


# Objective 1 -------------------------------------------------------------

# Examine the iris data and come up with the objective and the R script code needed to complete this objective
# Objective 1: Produce a frequency distribution (histogram) for Petal.Length,showing the relationship of the data distribution between species

plot6 <- ggplot(dat1, aes(x = Petal.Length)) +
  geom_histogram(aes(fill = Species), position = "dodge")
  facet_wrap(~Species, nrow = 3)
plot6

plot5 <- ggplot(dat1, aes(x = Petal.Length)) +
  geom_histogram(aes(fill = Species)) 
plot5

plot7 <- ggplot(dat1, aes(x = Petal.Length)) +
  geom_histogram(aes(fill = Species))+
  facet_wrap(~Species, nrow = 3)
plot7

plot8 <- ggplot(dat1, aes(x = Petal.Length)) +
  geom_histogram(aes(fill = Species))+
  facet_wrap(~Species, ncol = 3)
plot8

library(ggpubr)

ggarrange(plot6, plot5, plot7, plot8,
          nrow = 2, nol = 2,
          labels = "AUTO")


 # or 

plot5 <- ggplot(dat1, aes(x = Petal.Length)) +
  geom_histogram(aes(fill = Species))  # the first graph is much clear



# when two species share the same interval the species are stcked ontop of eachother

# examine the data and display the relationship between plants for one of the measured plants
# for the three plant species select petal length and understand the frequency 



