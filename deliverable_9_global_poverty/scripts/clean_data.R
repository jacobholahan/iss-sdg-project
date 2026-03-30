library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  # keep total population values
  filter(
    Age == "ALLAGE",
    Sex == "BOTHSEX",
    Location == "ALLAREA"
  ) %>%
  
  pivot_longer(
    cols = `2000`:`2023`,
    names_to = "year",
    values_to = "poverty_rate"
  ) %>%
  
  select(GeoAreaName, year, poverty_rate) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(poverty_rate = as.numeric(poverty_rate)) %>%
  
  filter(!is.na(poverty_rate))

write.csv(clean_data, "poverty_rate_clean.csv", row.names = FALSE)
