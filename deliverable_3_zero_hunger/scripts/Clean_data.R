library(readxl)

data <- read_excel(file.choose())

library(tidyr)

clean_data <- data %>%
  pivot_longer(
    cols = `2000`:`2024`,
    names_to = "year",
    values_to = "undernourishment_rate"
  )

library(dplyr)

clean_data <- clean_data %>%
  select(GeoAreaName, year, undernourishment_rate)

clean_data <- clean_data %>%
  rename(country = GeoAreaName)

clean_data <- clean_data %>%
  drop_na()

write.csv(clean_data, "undernourishment_clean.csv", row.names = FALSE)
