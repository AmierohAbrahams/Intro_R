# Day_5B
# Mapping 

library(tidyverse)
library(ggpubr)


load("data/south_africa_coast.RData")
load("data/sa_provinces.RData")
load("data/rast_annual.RData")
# load("data/MUR.RData")  #control shift c
load("data/MUR_low_res.RData")
sst <- MUR_low_res
rm(MUR_low_res)
head(sst)
head(south_africa_coast)

cols11 <- c("#004dcd", "#0068db", "#007ddb", "#008dcf", "#009bbc",
            "#00a7a9", "#1bb298", "#6cba8f", "#9ac290", "#bec99a")
cols11

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_point()
ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group))

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group))
# if you move the path above the polygon it will shade the polygon

mapdef <- ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  scale_fill_manual("Temp. (°C)", values = cols11) + # Set the colour palette
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0)
mapdef
ggsave(mapdef, filename = "mapdef.png")




map1 <- ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "Pink", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  scale_fill_manual("Temp. (°C)", values = cols12) +
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  labs(x = "longitude", y = "latitude")
map1


cols12 <- c("#8E5972", "#815B77", "#735C7A", "#645E7B", "#54607A", "#456176", "#366170", "#2A6069", "#225F60", " #205E56")
cols12
ggsave(map1, filename = "map1.png")

combo <- ggarrange(map1, mapdef,
          nrow = 2, ncol = 2, 
          labels = "AUTO")
combo

ggsave(combo, filename = "combo.png")
library(scales)
library(ggsn)
northSymbols()

sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent
sa_1

#change the polygon colour
#create a colour scale
# jpeg/pmg file

# Objective: adjust the fill of the polygon, adjust the colour of the polygon, adjust the colour of the provinces of borders, create a scale for continues data in bins, provide appropriate x and y lables, create a pmg or jpeg file
# Save the default and the new graph and then create a cobined panel

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "Pink", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  geom_point(data = cps, aes() +
  scale_fill_manual("Temp. (°C)", values = cols12) +
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  labs(x = "longitude", y = "latitude")+
  scalebar(x.min = 32, x.max = 34, y.min = -34, y.max = -32, # Set location of bar
           dist = 200, height = 0.2, st.dist = 0.8, st.size = 2, # Set particulars
           dd2km = TRUE, model = "WGS84") + # Set appearance
  north(x.min = 30, x.max = 32, y.min = -33, y.max = -31, # Set location of symbol
        scale = 1.2, symbol = 16)

load("data/cape_point_sites.RData")
cps <- cape_point_sites %>% 
  filter(site == "Noordhook")

# to pull out the fifth row of all the collums
cape_point_sites [5, ]


