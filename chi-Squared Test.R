library(tidyverse)
library(ggplot2)
library(forcats)
View(gss_cat)


library(tidyverse)

my_data <- gss_cat %>%
    select(marital) %>%
    filter(marital %in% c("Married", "Never married", "Divorced")) %>%
    mutate(marital = fct_drop(marital))

my_table <- table(my_data$marital)
View(my_table)


# chi-squared test for given probabilities

chisq.test(my_table)


my_data %>%
    table() %>%
    chisq.test()

#graphics


my_data %>%
    
    ggplot(aes(marital)) + geom_bar()
#For Race

my_data <- gss_cat %>%
    select(race)%>%
    filter(race %in% c("White",
                       "Black",
                       "Other")) %>%
    mutate(race = fct_drop(race))

my_table <- table(my_data)
View(my_table)


#Use Chi-Squared FOR RACE
chisq.test(my_table)

my_data %>%
    table() %>%
    chisq.test()
#GRAPHICS FOR RACE

my_data %>%
    ggplot(aes(race)) + geom_bar()

