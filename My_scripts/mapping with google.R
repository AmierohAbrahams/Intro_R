# Day 5
# Mapping with google


# ggmap -------------------------------------------------------------------

library(tidyverse)
library (ggmap)

load("data/cape_point_sites.RData")

cape_point <- get_map(location = c(lon = 18.36519, lat = -34.2352581),
                      zoom = 10, maptype = 'satellite')
cp_1 <- ggmap(cape_point) +
  geom_point(data = cape_point_sites, aes(x = lon+0.002, y = lat-0.007),
             colour = "red", size = 2.5) +
  labs(x = "", y = "")
cp_1

cp_2 <- cp_1 +
  geom_text(data = cape_point_sites, # Choose dataframe
            aes(lon+0.002, lat-0.007, label = site), # Set aesthetics
            hjust = 1.15, vjust = 0.5, # Adjust vertical and horizontal
            size = 3, colour = "white") # Adjust appearance
cp_2
