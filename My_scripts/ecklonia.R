ecklonia <- read.csv(file = "ecklonia.csv", header = TRUE)

summary(ecklonia)
ecklonia$stipe_length
ggplot(data = ecklonia, aes(x = stipe_length)) + 
  geom_histogram() + 
  labs(x = "stipe length (cm)") +
  theme_bw()

ggplot(data = ecklonia, aes(x = stipe_length, group = site)) + 
  geom_histogram(aes(fill = site)) + 
  labs(x = "stipe length (cm)") +
  theme_bw()

ggplot(data = ecklonia, aes(x = site, y = stipe_length)) + 
  geom_boxplot(aes(fill = site), outlier.colour = "red") + 
  labs(y = "stipe length (cm)") +
  theme_bw()

ggplot(data = ecklonia, aes(x = stipe_length, y = stipe_mass)) + 
  geom_point(aes(colour = site)) +
  labs(x = "stipe length (cm)", y = "stipe mass (kg)") +
  theme_bw()

ggplot(data = ecklonia, aes(x = stipe_length, y = stipe_mass)) + 
  geom_point(aes(colour = site)) + 
  labs(x = "stipe length (cm)", y = "stipe mass (kg)") +
  geom_smooth(method = lm, aes(colour = site), se = FALSE) +
  theme_bw()