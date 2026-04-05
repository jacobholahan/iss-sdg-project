library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  pivot_longer(
    cols = `2000`:`2024`,
    names_to = "year",
    values_to = "mobile_coverage"
  ) %>%
  
  select(GeoAreaName, year, mobile_coverage) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(mobile_coverage = as.numeric(mobile_coverage)) %>%
  
  filter(!is.na(mobile_coverage))

write.csv(clean_data, "mobile_network_coverage_clean.csv", row.names = FALSE)
