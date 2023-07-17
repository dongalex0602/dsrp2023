## load required libraries
library(dplyr)
library(ggplot2)

## Compare the mass of male and female star wars characters
## H0: mu_male = mu_female
## H1: mu_male != mu_female

sw_humans <- starwars %>% filter(species == "Human", mass > 0)
males <- sw_humans %>% filter(sex == "male")
females <- sw_humans %>%filter(sex == "female")

t.test(males$mass, females$mass, paired = F, alternative = "two.sided")
t.test(males$mass, females$mass, paired = F)
# p value is 0.06, i.e. not significant
# we fail to reject the null hypothesis


## ANOVA ####
iris

anova_results <- aov(Sepal.Width ~ Species, data = iris)

## Are any groups different from each other?
summary(anova_results)

## Which ones?
TukeyHSD(anova_results)


## Is there a significant difference in the mean petal lengths or petal widths by species?
anova_results <- aov(Petal.Width ~ Species, iris)
summary(anova_results)
TukeyHSD(anova_results)
## they are all significantly different



### Star Wars
head(starwars)
unique(starwars$species)

## Which 5 species are the most common?
top3_species <- starwars %>% 
  summarize(.by = species, 
            count = sum(!is.na(species))) %>% 
  slice_max(count, n = 3)

top3_species

starwars_top3species <- starwars %>% 
  filter(species %in% top3_species$species)

starwars_top3species

## Is there a significant difference in the mass of the top 3 species?
anova_res <- aov(mass ~ species, starwars_top3species)
summary(anova_res)
TukeyHSD(anova_res)

anova_res <- aov(height ~ species, starwars_top3species)
summary(anova_res)
TukeyHSD(anova_res)



## Chi-Squared ####
starwars_clean <- starwars %>% 
  filter(!is.na(species), 
         !is.na(homeworld))

t <- table(starwars$species, starwars$homeworld)
chisq.test(t) # not enough data


mpg
table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

## How do we get a contingency table of year and drv?
t <- table(mpg$year, mpg$drv)

chisq_res <- chisq.test(t)
chisq_res
chisq_res$p.value
chisq_res$residuals
# not significant

# install.packages("corrplot")
library(corrplot)

corrplot(chisq_res$residuals)


## chi-squared full analysis
heroes <- read.csv("data/heroes_information.csv")
head(heroes)

## clean data
heroes_clean <- heroes %>% 
  filter(Alignment != "-", 
         Gender != "-")

## plot the counts of alignment and gender
ggplot(heroes_clean, aes(x = Gender, y = Alignment)) +
  geom_count() +
  theme_minimal()

## make contingency table
t <- table(heroes_clean$Alignment, heroes_clean$Gender)
t

## chi squared test
chisq_res <- chisq.test(t)
chisq_res$p.value
chisq_res$residuals

corrplot(chisq_res$residuals, is.cor = F)
