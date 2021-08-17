---
title: "Review"
output: html_document
---

```{r message=FALSE, warning=FALSE}
# Load packages
library(ggplot2)
library(dplyr)

# Read in our graduation dataset
msleep <- read.csv("msleep_cleaned.csv")
```

```{r message=FALSE, warning=FALSE}
# Process msleep to include only animals of order Primates and Rodentia
msleep_filtered <- msleep %>%
  filter(order %in% c("Primates", "Rodentia")) %>%
  na.omit()

# Define function to convert ratios to percentage labels
convert_to_pct <- function(x) {
  pct <- paste0(x * 100, "%")
  return(pct)
}

# Create a stacked bar plot with facets and custom x and y axes
msleep_plot <- 
  ggplot(msleep_filtered, 
         aes(x = diet, 
             y = hours, 
             fill = status)) +
  geom_col(position = "fill") +
  facet_grid(rows = vars(order)) + 
  scale_x_discrete(
    labels = c("carni" = "Carnivore", 
               "herbi" = "Herbivore", 
               "omni" = "Omnivore")) +
  scale_y_continuous(labels = convert_to_pct) +
  labs(title = "Hours of Day by Sleep State, Diet, and Order")

# Print the plot to see what it looks like
msleep_plot

```
