#load library
library(magrittr)
library(readr)
library(dplyr)
library(ggplot2)

# import the score by score form
data <- read.table(file.choose(),header = TRUE )
head(data)

# calculate the cumulative score of each team in each time point
test <- data %>%
    group_by(team)%>%
    mutate(accumulate = cumsum(score) )

head(test)

# visualize the data with ggplot
ggplot(test,aes(x=time,y=accumulate,color= team))+
  geom_line()+
  labs(y="score",x="time(min)")




