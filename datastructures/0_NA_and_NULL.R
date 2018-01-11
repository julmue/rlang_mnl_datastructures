# NA
# Representation for missing data in statistical data sets.
# Value is existent but not known

## NA-aware functions
x <- c(88, NA, 192, 55, 69)

mean(x)
#> NA

mean(x, na.rm = TRUE)
#> 101

# NULL
# Representation for non-existing values
# Value is inexistent