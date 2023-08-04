library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() +
  scale_color_manual(values = c("red", "purple", "pink"), 
                     name = "Iris Species") +
  scale_x_continuous(limits = c(5, 7))


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() +
  scale_color_manual(values = c("red", "purple", "pink"), 
                     name = "Iris Species") +
  xlim(0, 8) +
  ylim(0, 4.5) + 
  theme_minimal() + 
  theme(axis.text.x = element_text(color = "red"))


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() +
  scale_color_manual(values = c("red", "purple", "pink"), 
                     name = "Iris Species") +
  xlim(0, 8) +
  ylim(0, 4.5) + 
  theme_minimal() + 
  theme(axis.text = element_text(color = "red"))


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() +
  scale_color_manual(values = c("red", "purple", "pink"), 
                     name = "Iris Species") +
  xlim(0, 8) +
  ylim(0, 4.5) + 
  theme_minimal() + 
  theme(axis.ticks = element_line(color = "red"))

