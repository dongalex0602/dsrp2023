# this is a comment
number <- 10 # set number to 10

# R Objects ####

ls() # print the names of all objects
rm("number") # remove the object(s)

number <- 5
decimal <- 1.5

letter <- "a"
word <- "hello"

logic <- TRUE
logic2 <- F


## VARIABLE TYPES
## There are 3 main classes (types): numeric, character, logical

##  - numeric - (10.5, 55, 787)
class(number)
class(decimcal)

##  - character, a.k.a. String - ("k", "R is exciting", "FALSE", "11.5")
class(letter)
class(word)

##  - logical, a.k.a. Boolean - (TRUE or FALSE)
class(logic)


## There is more variation in types
## typeof() determines the R internal storage mode of an object
typeof(number) # "double"
typeof(decimal) # "double"


## We can change the type of an object
as.character(number)
as.integer(number)
as.integer(decimal)


## HOW TO ROUND NUMBERS
round(decimal) # < 0.5 rounds down, <= 0.5 rounds up
round(22/7)
round(22/7, 3) # round to 3 decimal places

?round # pulls up the documentation for the function after the question mark

22/7
ceiling(22/7) # ceiling function always rounds up
floor(22/7) # floor function always rounds down

?as.integer
word_as_int <- as.integer("hello")


## NA VALUES
NA # unknown
NA + 5 # operations on NA return NA

## Use na.rm=TRUE to ignore NAs
sum(1, 2, 3, NA) # returns NA if any value is NA
sum(1, 2, 3, NA, na.rm=T)

mean(c(1, 2, 3, NA), na.rm=T)


## NAMING VARIABLES
name <- "Sarah"
NAME <- "Joe"
n.a.m.e <- "Sam"
n_a_m_e <- "Lisa"
name2 <- "Paul"

## Illegal naming characters: 
##  - starting with a number
##  - starting with an underscore
##  - operators: + - / * =
##  - conditionals: & ! < > |
##  - others: \ , space $ ?

## Good naming conventions
camelCase <- "start new words with a capital letter"
snake_case <- "underscores between words"



# Object Manipulation ####

number
number + 7

decimal
number + decimal

## Concatenate character vectors with paste() and paste0()
name
paste(name, "Parker", "is", "awesome") # concatenates character vectors
paste(name, "Parker is awesome")
paste0(name, "Parker") # concatenate with no space between words

paste(name, number) # we can join together characters and numbers
logic <- T
paste0(name, logic) # we can join together logicals as well

letter
paste(name2, "is not", letter, logic, "human")


## GREP - Global Regular Expression Print
## find regex in string
?grep
food <- "watermelon"
grepl("me", food) # T or F -> is the pattern in the character object?


## Substitute characters in words with sub()
sub("me", "you", food)
sub("me", "_", food)
sub("me", "", food)



# Vectors ####

## Make a vector of numerics
numbers <- c(1, 2, 3, 4, 5)


## Make a vector with a range of values
range_of_vals <- 1:5 # all integers from 1 to 5
5:10 # all integers from 5 to 10


## Generate a sequence of values as a numeric vector
seq(2, 10, 2) # from 2 to 10 (inclusive) by 2's
seq(1, 10, 2) # odd numbers between 1 and 10

## parameters and the order they are passed to the function can be specified
seq(from=2, to=10, by=2)
seq(by=2, from=2, to=10) # parameters can be out of order if they are named


## Generate a repeating vector with rep()
rep(3, 5) # repeat 3 5x
rep(c(1, 2), 5) # repeat 1, 2 5x


## how can we get all the values between 1 and 5 by 0.5?
seq(1, 5, .5)

## how can we get [1 1 1 2 2 2]?
c(rep(1, 3), rep(2, 3))
rep(c(1, 2), each=3)


## Make a vector of characters
letters <- c("a", "b", "c")
paste("a", "b", "c") # paste() doesn't create a vector — it concatenates strings

letters <- c(letters, "d")
letter
letters <- c(letters, letter)
letters <- c("x", letters, "w")


## Sampling from a vector
numbers <- 1:20 # make a vector of numbers from 1 to 20
five_nums <- sample(numbers, 5) # sample 5x (replacement=F by default)

## sort() to sort the vector
five_nums <- sort(five_nums)

## rev() to reverse the vector
five_nums <- rev(five_nums)
five_nums


fifteen_nums <- sample(numbers, 15, replace=T)
fifteen_nums <- sort(fifteen_nums)
length(fifteen_nums) # length of a vector
unique(fifteen_nums) # list the unique values in the vector

## how to get the number of unique values?
length(unique(fifteen_nums))

## get the count of values in the vector with table()
table(fifteen_nums)


## Element-wise operations
fifteen_nums + 5 # add 5 to each numeric in vector
fifteen_nums / 2 # divide each numeric in vector by 2

nums1 <- c(1, 2, 3)
nums2 <- c(4, 5, 6)
nums1 + nums2 # values are added together element-wise

nums3 <- c(nums1, nums2)
nums3 + nums1 # values are recycled in element-wise addition
nums3 + nums1 + 1

## what is the difference between these?
sum(nums3 + 1) # sum of (numerics + 1)
sum(nums3) + 1 # add 1 to the sum of numerics


## Vector indexing
## note that R indexes from 1
numbers <- rev(numbers)
numbers
numbers[1]
numbers[5]

numbers[c(1, 2, 3, 4, 5)]
numbers[1:5]
numbers[c(1, 5, 2, 12)]
i <- 5
numbers[i]



# Datasets ####

## mtcars is a built in R dataset
?mtcars
mtcars # print entire dataset to console
View(mtcars) # view entire dataset in new tab (note the capital "V")

summary(mtcars) # gives information about the spread of each variable
str(mtcars) # preview the structure of the dataset

names(mtcars) # names of the variables
head(mtcars, 5) # preview the first x rows of the dataset (6 by default)

## Pull out individual variables as vectors
mpg <- mtcars[,1] # rows x columns; blank means "all" -> all rows, first column
mtcars[2,2] # value at second row, second column
mtcars[3,] # third row, all columns

# first 3 columns
mtcars[, 1:3]

# use the names to pull out the columns
mtcars$gear # pull out the "gear" column
mtcars[, c("gear", "mpg")] # pull out the "gear" and "mpg" columns

sum(mtcars$gear)



# Statistics ####

View(iris)
iris

first5 <- iris$Sepal.Length[1:5]

mean(first5)
median(first5)
max(first5) - min(first5) # range

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
max(iris$Sepal.Length) - min(iris$Sepal.Length)

var(first5) # variance
sd(first5) # standard deviation
sqrt(var(first5)) # sqrt(var) == sd

var(iris$Sepal.Length)


## IOR
IQR(first5) # range of the middle 50% of the data
quantile(first5, 0.25) # Q1
quantile(first5, 0.75) # Q3


## Outliers
sl <- iris$Sepal.Length

lower <- mean(sl) - 3 * sd(sl) # lower threshold
upper <- mean(sl) + 3 * sd(sl) # upper threshold

quantile(sl, 0.25) - 1.5 * IQR(sl)
as.numeric(quantile(sl, 0.75)) + 1.5 * IQR(sl) # as.numeric() call means the quantile will not be printed to console


## Subsetting vectors
first5
first5 < 4.75 | first5 > 5 # logical vector output
first5[first5 < 4.75] # numeric vector according to the logical expression

values <- c(first5, 3, 9)
upper
lower


# Remove outliers
values[values > lower & values < upper] # keep values lower than upper and higher than lower
values
values_no_outliers <- values[values > lower & values < upper]


## Read in data
getwd() # get working directory
super_data <- read.csv("data/super_hero_powers.csv")



# Conditionals ####

x <- 5 # set x to 5

x == 3
x == 5
x != 3

## We can test all values of a vector at once
numbers <- 1:5

numbers < 3
numbers == 3

numbers[1]
numbers[c(1, 2)] # objects at position 1 and position 2
numbers[1:2] # objects from position 1 to position 2

numbers[numbers < 3] # numbers "where" numbers < 3


## outlier thresholds
lower <- 2
upper <- 4

## pull out only outliers
numbers[numbers < lower]
numbers[numbers > upper]

## Combine with | (or)
numbers[numbers < lower | numbers > upper]

## Use & to get all values in between outlier thresholds
numbers[numbers >= lower & numbers <= upper]

## Using & with outlier thresholds doesn't work
numbers[numbers < lower & numbers > upper]
