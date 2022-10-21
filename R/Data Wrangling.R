# Clear Global Environment #
rm(list = ls()) 

library(tidyverse)

Horse_Trail <- read_csv("C:/Users/14128/Desktop/Osburn Lab/Bailey R/Horse_Trail_Fen_Core.csv")

Data_long <- pivot_longer(Horse_Trail, 
                          cols = Sphagnum:Non_Bryophyte, 
                          names_to = "Species", 
                          values_to = "Percentage")
View(Data_long)

Subset_data <- Data_long %>%  
  filter(Species == "Sphagnum" | Species == "Other_Brown_Moss")

ggplot(data = Subset_data, aes(x = Depth, y = Percentage, fill = Species)) +
  geom_area() + 
  scale_x_reverse() + 
  coord_flip() +
  theme_classic()
