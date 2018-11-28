# Data Exploration on Black Friday Deals
# Set the working directory

setwd("W:/Blogs/blackfriday/black-friday")

mainData <- read.csv("BlackFriday.csv",header = TRUE)
head(mainData)

# 1) Which gender made the maximum purchase?
