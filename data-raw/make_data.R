library(tidyr)
library(dplyr)

population <- data.frame(tidyr::population)
write.csv(population, "data-raw/population.csv", row.names = FALSE)
population <- read.csv("data-raw/population.csv", stringsAsFactors = FALSE) %>%
  mutate(country = stringi::stri_trans_general(country, "latin-ascii"))

usethis::use_data(population, overwrite = TRUE)
