# Exercise 2
# A.A
# 25/02/18
# Section2
# Question 1
library(knitr)
library(tidyverse)
library(ggpubr)
library(dplyr)
library(lubridate)
load(file = "data/SACTNmonthly_v4.0.RData")
temp <- as_tibble(SACTNmonthly_v4.0)
unique(temp$site)
names(temp)
unique(temp$src)


kznsb.temp <- temp %>%
  filter(src == "KZNSB")
summary(aov(data = kznsb.temp, temp ~ site))
ggplot(kznsb.temp, aes(x = date, y = temp)) +
  geom_line(aes(group = site, colour = "red")) +
  facet_wrap(~site, ncol = 5) +
  labs(x = "Year", y = "Temperature(C)")

colnames(kznsb.temp)

try1 <- kznsb.temp %>%
  mutate(year = format(date, "%Y")) %>%
  group_by(site, year) %>%
  summarise(average_temp = mean(temp, na.rm = TRUE))

summary(aov(data = try1, average_temp ~ site))


final <- ggplot(data = try1, aes(x = year, y = average_temp)) +
  geom_line(aes(group = site, colour = "red")) +
  facet_wrap(~site, ncol = 5) +
  labs(x = "Year", y = "Temperature(C)")

final







# QUESTION 2/3 completed --------------------------------------------------



# Question 2

library(tidyverse)
library(readr)
lam <- read_csv2(file = "data/laminaria.csv")

unique(lam$site)
names(lam)
sites <- c("A-Frame", "Baboon Rock", "Batsata Rock", "Betty's Bay",
           "Bordjiestif North", "Buffels", "Buffels South",
           "Miller's Point", "Roman Rock")

laminaria <- lam %>% 
  filter(site %in% sites)

old <- ggplot(laminaria, aes(x = blade_length, y = blade_weight)) +
  geom_point(aes(group = site , colour = site)) +
  geom_line(aes(group = site , colour = site)) +
  facet_wrap(~site, ncol = 3) +
  scale_colour_brewer(palette = "Dark2") +
  labs(x = "Blade length (cm)", y = "Blade mass (Kg)", title = " A crazy graph of some data for False Bay sites")
old
new <- ggplot(laminaria, aes(x = blade_length, y = blade_weight)) +
  geom_point(aes(group = site , colour = site)) +
  geom_line(aes(group = site , colour = site)) +
  facet_wrap(~site, ncol = 3) +
  scale_colour_brewer(palette = "Set1") +
  labs(x = "Blade length (cm)", y = "Blade mass (Kg)", title = " A crazy graph of some data for False Bay sites")
new
library(ggpubr)
graph2 <- ggarrange(old,new,nrow = 2, ncol = 2,
                    labels = "AUTO")
graph2

ggsave(graph2, filename = "graph2.png")


# Question 3

tooth <- datasets::ToothGrowth

# This is a bargraph with a continues x variable and a continues y variable.

ggplot(tooth, aes(x = dose, y = len)) +
  geom_col(aes(fill = supp), position = "dodge") +
  labs(x = "Dose(mg/d)",y = "Tooth length")


# Error bars (In progress....)


test1 <- tooth %>% 
  group_by(supp, dose) %>% 
  summarise(mn.ln = mean(len),
            sd.ln = sd(len))
test1
test2 <- ggplot(test1, aes(x = dose, y = mn.ln, fill = supp)) +
  geom_col(aes(fill = supp), position = "dodge", colour = "black") +
  labs(x = "Dose(mg/d)",y = "Tooth length") +
  geom_errorbar(aes(ymin = mn.ln-sd.ln,
                    ymax = mn.ln + sd.ln),
                position = "dodge",width = 0.4)
 
ggsave(test2, filename = "test2.png")



  
  
  
