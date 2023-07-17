## install required packages
# install.packages("janitor")
# install.packages("tidyr")

## load required packages
library(tidyr)
library(janitor)
library(dplyr)

starwars
clean_names(starwars, case="small_camel")
new_starwars <- clean_names(starwars, case="screaming_snake")
clean_names(starwars, case="upper_lower")

clean_names(new_starwars)

new_starwars <- rename(new_starwars, "hair*color"=HAIR_COLOR)
clean_names(new_starwars)
                       

## make a table of all names and species of all female star wars characters by age
StarWarsWomen <- select(arrange(filter(starwars, sex=="female"), birth_year), name, species)

StarWarsWomen <- filter(starwars, sex=="female")
StarWarsWomen <- arrange(StarWarsWomen, birth_year)
StarWarsWomen <- select(StarWarsWomen, name, species)


## using pipes!
StarWarsWomen <- starwars |> 
  filter(sex=="female") |> 
  arrange(birth_year) |>
  select(name, species)

StarWarsWomen <- starwars %>% 
  filter(sex=="female") %>% 
  arrange(birth_year) %>% 
  select(name, species)

StarWarsWomen


## 10 tallest Star Wars characters
slice_max(starwars, height, n=10)

slice_max(starwars, height, n=1, by=species)
slice_max(starwars, height, n=2, by=species)
slice_max(starwars, height, n=2, by=species, with_ties=F)


## Tidy data ####

## pivot_longer
table4a
tidy_table4a <- pivot_longer(table4a, 
                             cols = c(`1999`, `2000`),
                             names_to = "year",
                             values_to = "cases")

table4b # shows population data
## how to picot table4b into a "tidy" format
tidy_table4b <- pivot_longer(table4b, 
                             cols = c(`1999`, `2000`), 
                             names_to = "year", 
                             values_to = "popluation")


## pivot_wider
table2

pivot_wider(table2, 
            names_from = type, 
            values_from = count)


## separate
table3

separate(table3, 
         rate, 
         into = c("cases", "population"))

separate(table3, 
         rate, 
         into = c("cases", "population"), 
         sep="/")


## unite
table5
tiday_table5 <- unite(table5, 
      "year", 
      c("century", "year"), 
      sep="")

tidy_table5 <- table5 |> 
  unite("year", c("century", "year"), sep = "/") |>
  separate(rate, into = c("cases", "population"), sep = "/")


## bind rows
new_data <- data.frame(country = "USA", year = "1999", cases = "1042", population = "2000000")

bind_rows(tidy_table5, new_data)
