# Day_3B Facet.R
# About Faceting
# 2018/02/01



# set up ------------------------------------------------------------------

library(tidyverse)
library(ggpubr)

# Loading data ------------------------------------------------------------

nandos <- datasets::ChickWeight


#use alpha for transpancy
#use lab for the labels
# Make graphs -------------------------------------------------------------

plot1 <- ggplot(nandos, aes(x = Time, y = weight)) +
  geom_line(aes(colour = Diet, group = Chick), alpha = 0.5) +
  geom_point(aes(shape = Diet)) +
  labs(x = "Time(days)", y = "Mass (g)")

plot2 <- ggplot(nandos, aes(x = Time, y = weight)) +
  geom_line(aes(colour = Diet, group = Chick), alpha = 0.5) +
  geom_point() +
  facet_wrap(~Diet, ncol = 2) +
  labs(x = "Time(days)", y = "Mass (g)")
plot2



plot3 <- ggplot(nandos, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +
  labs(x ="Final Mass (g)", y = "Count")
plot3


lostLives <- nandos %>% 
  filter(Time == 21)

plot4 <- ggplot(lostLives, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
plot4

ggarrange(plot1, plot2, plot3, plot4,
          ncol = 2, nrow = 2, 
          labels = c("A", "B", "c", "D"),
          common.legend = TRUE)
ggsave

new <- ggarrange(plot1, plot2, plot3, plot4,
          ncol = 2, nrow = 2, # Set number of rows and columns
          labels = c("A", "B", "C", "D"), # Label each figure
          common.legend = TRUE)
new
library(boot)
pee <- boot::urine
ggplot(pee, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = cond))
 
# colour testing a person with or without kidney stones using a change in colour

ggplot(pee, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r)))

ggplot(pee, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r))) +
  scale_colour_brewer(palette = "Dark2")

ggplot(urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = cond)) +
  scale_colour_gradientn(colours = c("#A5A94D", "#6FB16F", "#45B19B",
                                     "#59A9BE", "#9699C4", "#CA86AD"))
#with or without kidney stones use scale to discrete data.

ggplot(pee, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r))) +
  scale_colour_manual(values = c("pink", "maroon"), # How to use custom palette
                      labels = c("no", "yes")) + # How to change the legend text
  labs(colour = "crystals")

ecklonia <- read_csv2("data/ecklonia.csv")
