library(dplyr)
library(ggplot2)

# two new functions
ifelse()
case_when()

x <- 7
ifelse(x<5, "small number", "big number")

x <- c(1, 3, 5, 7, 9)
ifelse(x<5, "small number", "big number")

head(iris)
mean(iris$Petal.Width)
iris_new <- iris

## Add categorical column
iris_new <- mutate(iris_new, 
                   peta_size = ifelse(Petal.Width > 1, "big", "small"))

iris_new <- mutate(iris_new, 
                   peta_size = case_when(
                     Petal.Width < 1 ~ "small", 
                     Petal.Width < 2 ~ "medium", 
                     Petal.Width >= 2 ~ "big", 
                     TRUE ~ "BIG"
                    ))
iris_new


## saving plots
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

## 3 ways
##  1 - save image as
##  2 - save as image
##  3 - ggsave("plots/scatterPlot.png")