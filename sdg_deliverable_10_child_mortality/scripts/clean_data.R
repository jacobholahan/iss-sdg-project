library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  # keep total population
  filter(Sex == "BOTHSEX") %>%
  
  pivot_longer(
    cols = `2000`:`2024`,
    names_to = "year",
    values_to = "under5_mortality"
  ) %>%
  
  select(GeoAreaName, year, under5_mortality) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(under5_mortality = as.numeric(under5_mortality)) %>%
  
  filter(!is.na(under5_mortality))

write.csv(clean_data,"under5_mortality_clean.csv", row.names = FALSE)
