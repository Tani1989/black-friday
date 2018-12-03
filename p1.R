# Data Exploration on Black Friday Deals
# Set the working directory

setwd("W:/Blogs/blackfriday/black-friday")

mainData <- read.csv("BlackFriday.csv",header = TRUE)
head(mainData)

# 1) Which gender made the maximum purchase?
colnames(mainData)
main_Data1 <- mainData[,c(3,12)]
head(main_Data1)

# Aggregate the data according to the gender.

Aggregate_data <- aggregate(as.numeric(main_Data1$Purchase) ~ Gender,data = main_Data1,FUN = sum)

# Rename Column name
names(Aggregate_data)[2] <- paste("Purchase")

Aggregate_data

Aggregate_data$Purchase <- Aggregate_data$Purchase/1000000000
# creating bar graph with ggplot2
install.packages("ggplot2")
library(ggplot2)
options(scipen=999)

ggplot(data = Aggregate_data,aes(x = Gender,y = Purchase,fill = Gender)) + geom_bar(stat = "identity") +
  ylab("Purchase(billions)") + theme_classic()

# Hence the males are the one who make maximum purchases during black friday.

head(mainData)
# 2) Which age group make the maximum purchases?

main_Data2 <- mainData[,c(3,4,12)]
head(main_Data2)

#subset_data1 <- subset(main_Data2,main_Data2$Gender == "M")
#head(subset_data1,20)

Aggregate_Data1 <- aggregate(Purchase ~ Age + Gender,data = main_Data2,FUN = sum)
Aggregate_Data1

# Create a lollipop chart .
#ggplot(data = Aggregate_Data1,aes(x = Age,y = Purchase,fill = Gender)) + geom_bar(stat = "identity",position = "dodge")







ggplot(Aggregate_Data1)+
  geom_linerange(aes(x = Age, ymin = 0, ymax = Purchase, colour = Gender), 
                 position = position_dodge(width = 1))+
  geom_point(aes(x = Age, y = Purchase, colour = Gender),
             position = position_dodge(width = 1)) + theme_classic()
 

