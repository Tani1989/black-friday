# Data Exploration on Black Friday Deals
# Set the working directory

setwd("W:/Blogs/blackfriday/black-friday")

mainData <- read.csv("BlackFriday.csv",header = TRUE)
head(mainData)

# 1) Which gender made the maximum purchase?
colnames(mainData)
subset_Data1 <- mainData[,c(3,12)]
head(subset_Data1)

# Aggregate the data according to the gender.

Aggregate_data <- aggregate(as.numeric(subset_Data1$Purchase) ~ Gender,data = subset_Data1,FUN = sum)

# Rename Column name
names(Aggregate_data)[2] <- paste("Purchase")

Aggregate_data

# creating bar graph
