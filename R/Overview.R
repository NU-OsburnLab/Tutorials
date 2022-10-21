## Basics/Fundamentals ##
rm(list = ls()) # Clear Global Environment 

install.packages("") # Since R is based on libraries and packages, if the necessary package is not already installed on your computer you must do so using this code. This action only needs to be performed once for your computer. After which it can just be loaded using the library() function 

library() # This function will load the desired package that you want to work with (note this should not be in quotes; however, the name of the package should be in quotes when installing a package) 

## Once your global environment is cleared (optional) and your desired libraries are loaded we now have to import our data. The most common forms of data files are excel (.xlsx) and csv (.csv) files. R can handle either perfectly fine. CSV files are preferable since they are smaller file sizes and can be loaded and run faster with larger data sets. ##

library(readxl)
Data_Frame <- read_excel() # This function will be used if you are loading an excel file. File pathway goes in parenthesis 

library(readr)
Data_Frame <- read.csv() # This function will be used for csv files 

x <- rnorm(1000, mean = 75) # Create an object "x" with 1000 observations that have a normal distribution
y <- rnorm(1000, mean = 60) # Create an object "y" with 1000 observations that have a normal distribution

data_frame <- cbind(x,y) # Concatenate objects x and y into a matrix 
data_frame <- as.data.frame(data_frame) # Convert the matrix into a data frame 

# Rules for Data Frames #
# 1. Each variable should be a single column 
# 2. Every column should be the same length 
# 3. R does not understand spaces, use an underscore,period, or Camel Case
# 4. R is case sensitive 

dev.off() # Remove plots from your viewer 



