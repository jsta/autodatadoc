dictionary <- dplyr::bind_rows(
  c(name = "country", description = "Country name"),
  c(name = "year", description = "Year"),
  c(name = "population", description = "Population")
)

write.csv(dictionary, "data-raw/dictionary.csv", row.names = FALSE)
