library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  filter(Location == "ALLAREA") %>%
  
  pivot_longer(
    cols = `2004`:`2024`,
    names_to = "year",
    values_to = "inadequate_housing"
  ) %>%
  
  select(GeoAreaName, year, inadequate_housing) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(inadequate_housing = as.numeric(inadequate_housing)) %>%
  
  filter(!is.na(inadequate_housing))

write.csv(clean_data, "urban_inadequate_housing_clean.csv", row.names = FALSE)
