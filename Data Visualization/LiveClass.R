library(tidyverse)

##data visualization
##ggplot => grammar of graphic
#base R visualization
plot(mtcars$mpg, mtcars$hp)
plot(mtcars$mpg, mtcars$hp, pch=16, col="red")

#boxplot
boxplot(mtcars$mpg)

#barplot
t1 <- table(mtcars$am)mtcars %>%
    count(am)barplot(t1)

#ggplotggplot(data = mtcars)
ggplot(data = mtcars, mapping = aes(y=mpg))
ggplot(data = mtcars, mapping = aes(x=mpg)) +
    geom_histogram()

# one variable, numberic
ggplot(data = mtcars, mapping = aes(x=mpg)) +
    geom_histogram(bins=10)

ggplot(data = mtcars, mapping = aes(x=mpg)) +
    geom_density()

ggplot(data = mtcars, mapping = aes(x=mpg)) +
    geom_freqpoly()

#short term
ggplot(mtcars, aes(mpg)) +
     geom_histogram(bins=5)

p1 <- ggplot(mtcars, aes(mpg)) +
     geom_histogram(bins=5)

p2 <- ggplot(mtcars, aes(hp)) +
     geom_histogram(bins=5)

mtcars %>%
    filter(hp <= 200) %>%
    count()

mtcars %>%
    count(am)

mtcars %>%
    mutate(am = ifelse(am==0, "Auto", "Manaul")) %>%
    count(am) 

mtcars %>%
    mutate(am = ifelse(am==0, "Auto", "Manaul")) %>%
    count(am) %>%
    ggplot(aes(am, n)) +
        geom_col()

#1st method: prep summary table before make bar chart; summary table + geom_col
t2 <- mtcars %>%
    mutate(am = ifelse(am==0, "Auto", "Manaul")) %>%
    count(am)

ggplot(t2, aes(x=am, y=n)) +
    geom_col()

#2nd method: if not prep; geom_col
mtcars <- mtcars %>%
    mutate(am = ifelse(am==0, "Auto", "Manaul"))

ggplot(mtcars, aes(am)) +
    geom_col() #error


##two variables, numeric
##scatetr plot
ggplot(mtcars, aes(x=hp, y=mpg)) +
     geom_point(col="red", size=5)

#quiz: geom_col vs geom_bar
#อะไรใช้กับ summary table?

#change factor to ordinal factor
#ordinal factor
#temp <- c("high", "med", "low", "high")
#temp <- factor(temp, levels = c("low", "med", "high"), ordered = TRUE)


##data frame => diamond
diamondsglimpse(diamonds)
#frequency table
diamonds %>%
    count(cut, color, clarity)
#sample
diamonds %>%
    sample_n(5)
#fix sample
set.seed(42)
diamonds %>%
    sample_n(5)diamonds %>%
    sample_frac(0.1)diamonds %>%
    slice(1:5)

#relationship
ggplot(diamonds, aes(carat, price)) +
geom_point()

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    geom_smooth()

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    geom_smooth(method = "loess")

ggplot(diamonds %>% sample_n(500), aes(carat, price)) +
    geom_point() +
    geom_smooth(method = "loess") +
    geom_rug()    

p3 <- ggplot(diamonds %>% sample_n(500), aes(carat, price)) +
    geom_point() +
    geom_smooth(method = "loess") +
    geom_rug()

#setting vs mapping
ggplot(diamonds, aes(price)) +
    geom_histogram(bins=100, fill="gold")

ggplot(diamonds, aes(price)) +
    geom_histogram(bins=100, fill="salmon")

ggplot(diamonds, aes(price)) +
    geom_histogram(bins=100, fill="#2585F9")

ggplot(diamonds %>% sample_n(500),
       aes(carat, price)) +
    geom_point(size=5, alpha=0.2, col="red")

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
    geom_point(size=5, alpha=0.5)

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut, shape=cut)) +
    geom_point(size=5, alpha=0.5) +
    theme_minimal()

##SETTING vs. MAPPING??
ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
    geom_point(size=5, alpha=0.5) +
    theme_minimal() +
    labs(
        title="Relationship between carat and price",
        x = "Carat",
        y = "Price USD",
        subtitle = "We found a positive relationship",
        caption = "Datasource: diamaonds ggplot2"    ) +
    scale_color_manual(values = c("red", "green", "blue", "gold", "salmon"))

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
    geom_point(size=5, alpha=0.5) +
    theme_minimal() +
    labs(
        title="Relationship between carat and price",
        x = "Carat",
        y = "Price USD",
        subtitle = "We found a positive relationship",
        caption = "Datasource: diamaonds ggplot2"    ) +
    scale_color_viridis_d(direction = -1)

#color brewer: qual vs vs
ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
    geom_point(size=5, alpha=0.5) +
    theme_minimal() +
    labs(
        title="Relationship between carat and price",
        x = "Carat",
        y = "Price USD",
        subtitle = "We found a positive relationship",
        caption = "Datasource: diamaonds ggplot2"    ) +
    scale_color_brewer(type = "qual", palette = 2)

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
    geom_point(size=5, alpha=0.5) +
    theme_minimal() +
    labs(
        title="Relationship between carat and price",
        x = "Carat",
        y = "Price USD",
        subtitle = "We found a positive relationship",
        caption = "Datasource: diamaonds ggplot2"    ) +
    scale_color_brewer(type = "div", palette = 4)

#map color scale
ggplot(mtcars, aes(hp, mpg)) +
    geom_point(size=5, alpha=0.7) +
    theme_minimal()

ggplot(mtcars, aes(hp, mpg,col=wt)) +
    geom_point(size=5, alpha=0.7) +
    theme_minimal()

ggplot(mtcars, aes(hp, mpg,col=wt)) +
    geom_point(size=5, alpha=0.7) +
    theme_minimal() +
    scale_color_gradient(low="gold", high = "purple")

#facet
ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    theme_minimal() +
    facet_wrap( ~cut)

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    theme_minimal() +
    facet_wrap( ~cut, ncol=5)

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    theme_minimal() +
    facet_wrap( ~cut, ncol=1)

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point() +
    geom_smooth() +
    theme_minimal() +
    facet_wrap( ~cut, ncol=1)

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point(alpha=0.3) +
    geom_smooth(col="red", fill="gold") +
    theme_minimal() +
    facet_wrap( ~cut, ncol=3)

ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point(alpha=0.3) +
    geom_smooth(col="red") +
    theme_minimal() +
    facet_grid(cut ~color)

#combine chart
install.packages("patchwork")
library(patchwork)
library(ggplot2)

qplot(mpg, data=mtcars, geom="histogram", bins=10)

qplot(hp, mpg, data=mtcars, geom="point")

qplot(hp, data=mtcars, geom = "density")

p1 <- qplot(mpg, data=mtcars, geom="histogram", bins=10)

p2 <- qplot(hp, mpg, data=mtcars, geom="point")

p3 <- qplot(hp, data=mtcars, geom = "density")

#quick plot
p1 +p2 + p3
(p1+p2) /p3
p1/p2/p3

p4 <- ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
    geom_point(alpha=0.3) +
    geom_smooth(col="red") +
    theme_minimal() +
    facet_grid(cut ~color)

(p1+p2+p3)/p4
