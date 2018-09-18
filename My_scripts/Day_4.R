# Day_4 
# Recap 
# Amieroh Abrahams
# 2018/02/22

# Setup  ------------------------------------------------------------------

library(tidyverse)



# Load the data -----------------------------------------------------------

# load the data the commond used to load this is called

load("data/SACTNmonthly_v4.0.RData")

#rename it to make it easier

temp <- SACTNmonthly_v4.0
head(SACTNmonthly_v4.0, 2) # takkes us to the first two rows

rm(SACTNmonthly_v4.0)



# what sources are avaiabale? ---------------------------------------------

unique(temp$src) #to check what data there is 
unique(temp$site) #to check how many sites are there

# Subset data -------------------------------------------------------------
#creating a histogram using a certain set of data
temp %>%
  filter(src == "SAWS")



saws.temp <- temp %>%  # adding a name to it for later use..... the name saws.temp is added here
  filter(src == "SAWS")


# Plot the data -----------------------------------------------------------

#use the details within histogram() otherwise r will just use the default function
#bin = means will use a certain section of data
#creating a graph
#binwidtch: look at the max temp and divide them into specific ranges

ggplot(saws.temp, aes(x = temp)) +
  geom_histogram(position = "dodge", binwidth = 2)

# next graph (make this for project)

ggplot(saws.temp, aes(x = temp)) +
  geom_histogram() +
  facet_wrap(~site)


# select specific sites ---------------------------------------------------
# for this create a vector this will filter only certain sites

sites <- c("Gordons baty", "Muizenberg", "Kalk Bay", "Fish Hoek")
filter(site %in% sites)


# bar graphs --------------------------------------------------------------



# bargraphs and how to choose colour 
# load in new data
library(readr)
eckl <- read_csv2(file = "data/ecklonia")
