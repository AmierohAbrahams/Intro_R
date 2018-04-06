# Day_4B
# Section 2 (Ecklonia)
# Amieroh
# 2018/02/22


# Bar Graphs --------------------------------------------------------------
# csv loaded beccause it is in  a comma and not semi-colon.


library(readr)
library(dplyr)
eckl <- read_csv(file = "data/ecklonia.csv")
eckl # control enter this


#create a bar graph, what is a bar graph: display the mean at several different ctogories
 
dat1 <- eckl %>%
  group_by(site) %>% 
  summarise(mn.fr.len = mean(frond_length))
dat1

lam <- read_csv2(file = "data/laminaria.csv")
dat1 <- lam %>%
  group_by(site) %>% 
  summarise(mn.fr.len = mean(blade_length),
            sd.fr.len = sd(blade_length))
dat1


ggplot(dat1, aes(x = site, y = mn.fr.len)) +
  geom_col(aes(fill = site))

#change the colour

ggplot(dat1, aes(x = site, y = mn.fr.len)) +
  geom_col(aes(fill = site)) +
  scale_fill_brewer(palette = "Spectral")

# how to add the sd around the mean

dat1 <- lam %>%
  group_by(site) %>% 
  summarise(mn.fr.len = mean(blade_length),
            sd.fr.len = sd(blade_length))
dat1

ggplot(dat1, aes(x = site, y = mn.fr.len)) +
  geom_col(aes(fill = site)) +
  geom_errorbar(aes(ymin = mn.fr.len - sd.fr.len,
                ymax  = mn.fr.len + sd.fr.len)) +
  scale_fill_brewer(palette = "Spectral")

# do a line running through a dot and the dots indicating the mean showing the different colours dot and error bars running through a colour

ggplot(dat1, aes(x = site, y = mn.fr.len, group = 1)) +
  geom_point(aes(fill = site)) +  
  geom_line(colour = "salmon") +
  geom_errorbar(aes(ymin = mn.fr.len - sd.fr.len,
                    ymax  = mn.fr.len + sd.fr.len, colour = site)) +
  scale_colour_discrete(guide = FALSE) +
  scale_y_continuous(limits = c(0, 190)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  
# if not sure use google to find an answer.... 



