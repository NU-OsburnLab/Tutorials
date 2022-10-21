# Clear Global Environment #
rm(list = ls()) 

# Load Libraries #
library(tidyverse)
library(corrplot)

# Generate 100 random numbers with a normal distribution #
set.seed(123) # Set seed for reproducibility
x <- rnorm(100) # generate 100 random numbers and set it to the object x
y <- rnorm(100, mean = 10) # generate 100 random number with a normal distribution and a mean of 10 to the object y
data_set <- cbind(x,y) %>% # combine the x and y objects into a single matrix 
  as.data.frame() # convert the matrix to a data frame 

# Extracting Statistical Information # 
model <- lm(y ~ x, data_set) # Set up an calculate linear model 
print(model) # Print information to determine model 
model_predict <- predict(model, interval = "confidence", level = 0.95) %>% 
  as.data.frame() # Predict new data using the model and determine 95% confidence intervals of the model

# Create a scatter plot # 
ggplot(data = data_set, aes(x = x, y = y)) + 
  geom_point(size = 5, color = "darkmagenta", shape = 15) + 
  geom_smooth(method = "lm", 
              color = "black", 
              linetype = "solid", 
              alpha = 0, 
              fill = "grey") + 
  geom_line(data = model_predict, aes(y = lwr), color = "black", linetype = "dashed") + 
  geom_line(data = model_predict, aes(y = upr), color = "black", linetype = "dashed") + 
  labs (x = "X", y = "Y") + 
  theme_bw() + 
  theme(axis.text = element_text(size = 16),
        axis.title = element_text(size = 16))  

# Exercise: Make a scatter plot with your own loaded data # 







# Create a Histogram # 
ggplot(data = data_set, aes(x = x)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.25, fill = "forestgreen", color = "black") + 
  geom_density(linetype = "dashed", size = 1) + 
  theme_classic() + 
  theme(axis.text = element_text(size = 16),
        axis.title = element_text(size = 16))   

# Extract Descriptive Statistical Information #
summary(data_set) # This returns min, max, mean, and quartile ranges 

# Correlation Matrix #
a <- rnorm(100, mean = 10) 
b <- a * 2 
c <- rnorm(100, mean = 5)/a
d <- a + (c^2) 
matrix <- cbind(a, b, c, d)
data_frame <- matrix %>% 
  as.data.frame()

# Calculate the Correlation between variables 
cor_matrix <- cor(matrix, method = "pearson")

# Plot Correlogram from Correlation Matrix #
correlation_plot <- corrplot(cor_matrix, 
                             method = "color", 
                             type = "lower",
                             hclust.method = "ward")

# Explore Relationships from Correlogram #
ggplot(data_frame, aes(x = c, y = d)) + 
  geom_point() + 
  geom_smooth(method = "lm", 
              color = "black", 
              linetype = "dashed", 
              fill = "grey", 
              alpha = 0.4) + 
  theme_bw()

