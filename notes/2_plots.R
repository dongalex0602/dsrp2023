# # install required packages
# install.packages("ggplot2")

# load required packages
library(ggplot2)
?ggplot2 # pull up documentation

# mpg dataset
str(mpg)
?mpg

ggplot(data=mpg, mapping=aes(x=hwy, y=cty)) +
  geom_point() +
  labs(x="highway mpg", 
       y="city mpg", 
       title="car city vs highway milage")

# HISTOGRAMS ####
# - histograms tell us the the frequency of **one numeric variable**
# - shows how often each value appears in our dataset

## example using mpg$hwy:
ggplot(mpg, aes(x=hwy)) +
  geom_histogram()

## example using iris$Sepal.Length
ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram() +
  labs(title="Frequency of Iris Sepal Lengths", 
       x="sepal length", 
       y="number of flowers")

# We can set the number of bars with `bins`
ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram(bins=30) # default: bins=30

# We can set the size of bars with `binwidth`
ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram(binwidth=0.25)



# DENSITY PLOT ####
# - used to plot the frequency of **one continous numeric variable**
# - essentially a histogram with an infinite number of bins of infinitely small size
# - gives an idea of the spread of the data
# - the actual values of the y-axis are generally less useful

## example using mpg$hwy:
ggplot(data=mpg, aes(x=hwy)) + 
  geom_density()

# we can use `y=after_stat(count)` to transform the density into the count of the data
ggplot(data=mpg, aes(x=hwy, y=after_stat(count))) + 
  geom_density()

## example using iris$Sepal.Length
ggplot(iris, aes(x=Sepal.Length, y=after_stat(count))) +
  geom_density() +
  labs(title="Frequency of Iris Sepal Lengths", 
       x="sepal length", 
       y="count")



# BOXPLOTS ####
# - used to plot the frequency of **one numeric variable**
# - the box tells us about the spread of the middle 50% of our data
# - the whiskers differentiate outliers in the data

## example using mpg$hwy
ggplot(mpg, aes(x=hwy)) +
  geom_boxplot()

## example using iris$Sepal.Length
ggplot(data=iris, aes(x=Sepal.Length)) +
  geom_boxplot()

# we can also plot boxplots vertically if desired
ggplot(data=iris, aes(y=Sepal.Length)) +
  geom_boxplot()

# mapping y is optional but useful if comparing across a category
# - similar to violin plots
ggplot(data=iris, aes(x=Sepal.Length, y=Species)) +
  geom_boxplot()



# VIOLIN PLOTS ####
# - are used to plot the frequency of 1 numeric variable by 1 categorical variable
# - used to compare **across different categorical variables**
# - the violins are vertical density plots reflected upon each other
# - violin plots tell us of the distributions of data in each category compare to each other
# - sometimes data may have identical (or mostly identical) boxplots, but different distributions.
#   In this case, it may be helpful to create a violin plot

# Syntax:
# ggplot(data=dataset, mapping=aes(x=category, y=column_name)) +
#    geom_violin()


## example plotting mpg$hwy by mpg$class
ggplot(mpg, aes(class, hwy)) +
  geom_violin()

## example plotting iris$Sepal.Length by iris$Species
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_violin() +
  labs(title="Distribution of Iris Sepal Lengths by Species", 
       x="Species", 
       y="Sepal Length")


# LAYERING VIOLIN PLOTS AND BOX PLOTS ####
# - best of both worlds, you get the info of both boxplots and violin plots

## example plotting iris$Sepal.Length by iris$Species
ggplot(data=iris, aes(x=Species, y=Sepal.Length)) +
  geom_violin() + geom_boxplot(width=0.2) +
  labs(title="Distribution of Iris Sepal Lengths by Species", 
       x="Species", 
       y="Sepal Length")



# COLORS ####
# - adding color to a plot can make it more visually appealing or easy to read
# - 657 built in color names can be viewed with `colors()`
# - color may also be specified with hex codes

# Syntax:
# ggplot(data=dataset, mapping=aes(x=column_name)) +
#   geom_plotType(color="color", fill="fill_color") +
#   labs(title="title", x="x-axis", y="y-axis")

# - the `color` parameter will change the color of lines and dots in your plot
# - the `fill` parameter fills in the plot with the specified color

# - if you set the color based on a variable, then it must be wrapped in an aes() call


ggplot(data = iris, aes(x=Species, y=Sepal.Length)) + 
  geom_violin(color="violet", fill="grey") +
  geom_boxplot(width=0.2, fill=NA)

ggplot(data = iris, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_violin() +
  geom_boxplot(width=0.2)

ggplot(data = iris, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_violin() +
  geom_boxplot(width=0.2, fill="white")

ggplot(data = iris, aes(x=Species, y=Sepal.Length)) + 
  geom_violin(aes(fill=Species)) +
  geom_boxplot(width=0.2)


# BAR PLOTS ####
# - can be used to plot the distribution of **one categorical variable**
#   Do not confuse these with histograms which show the distribution of one numeric variable
# - can also be used to plot 1 numeric variable vs 1 categorical variable

# - by default, `geom_bar()` provides a count of one categorial variable

# Syntax:
# ggplot(data=dataset, mapping=aes(x=category_column_name)) +
#   geom_bar()

# - if we do not want to look at count, we can instead look at a summary statistic of
#   our data of interest for each category

# Syntax:
# ggplot(data=dataset, mapping=aes(x=category_column_name, y=numeric_column_name)) +
#   geom_bar(stat="summary",
#            fun="some_function")

# - `fun` species the function we want to use to calculate our summary statistic.
# - generally, we look at `fun="mean"` or `fun="median"`


## example plotting iris$Sepal.Length by iris$Species
ggplot(data=iris, aes(x=Species, y=Sepal.Length)) + 
  geom_bar(stat="summary", fun="mean")

# we can color the bars by Species
ggplot(data=iris, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_bar(stat="summary", fun="mean")



# SCATTER PLOTS ####
# - usually used to plot 1 numeric variable vs 1 numeric variable
# - may be used to plot 1 numeric variable vs 1 categorical variable (however,
#   in these cases we may prefer a JITTER PLOT)

# Syntax:
# ggplot(data=dataset, aes(x=column_1, y=column_2)) +
#   geom_point()


## example plotting mpg$hwy by mpg$cty
ggplot(data=mpg, aes(x=hwy, y=cty)) +
  geom_point()

## example plotting iris sepal lengths by sepal width
## - 1 numeric variable vs 1 numeric variable
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()


## example plotting iris species by sepal length
## - 1 categorical variable by 1 numeric variable
ggplot(data=iris, aes(x=Species, y=Sepal.Length)) + 
  geom_point()

# using a jitter plot for the same data enables us to see that some datapoints
# over lap with each other
ggplot(data=iris, aes(x=Species, y=Sepal.Length)) + 
  geom_jitter(width=0.2)



# SAVING PLOTS TO COMPUTER ####
# 3 ways to save:
# - click `Export` at the top of the plots window -> `save as image`

# - use the `ggsave()` function
ggsave("plots/exampleJitter2.png")

# - rightclick -> `save image as` 
#   (not recommended)



# LINE PLOTS ####
# - used to plot 1 numeric variable vs 1 numeric variable

# Syntax:
# ggplot(data=dataset, aes(x=column_1, y=column_2)) +
#   geom_line()

# - if we have more than one Y value per X value, we can use `stat="summary"`


## example plotting mpg hwy by cty
ggplot(data=mpg, aes(x=hwy, y=cty)) +
  geom_line() # without `stat="summary`

ggplot(data=mpg, aes(x=hwy, y=cty)) +
  geom_line(stat="summary", fun="mean") # with `stat="summary"`


## example plotting iris sepal length vs sepal width
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point() +
  geom_line() # without `stat="summary`

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point() +
  geom_line(stat="summary", fun="mean") # with `stat="summary"`

# we may instead add a line of best fit to the data using `geom_smooth()`
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point() +
  geom_smooth(se=F) + # `se` is short for standard error
  theme_minimal() # we can change the themes of graphs with `theme_...()`



# OTHER THINGS ####

# Color Scales
ggplot(data=iris, aes(x=as.factor(Sepal.Length), y=Sepal.Width)) +
  geom_point(aes(color=Species)) + 
  scale_color_manual(values=c("violet", "lightpink", "red"))


# Factor Data Type
# - sometimes categorical data is stored in R as the numeric type (e.g. years).
# - but we don't want to treat this as a numeric variable, so we need to convert it.

mpg$year <- as.factor(mpg$year) # change the year variable type from numeric to factor

iris$Species <- factor(iris$Species, levels=c("versicolor", "setose", "virginica"))
