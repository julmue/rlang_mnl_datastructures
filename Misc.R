# querying the mode / type of an expression
typeof(1.0)
typeof(1)

# NA and NULL Values
#
# R has two values to denote the absence of a "proper" value:
# - NA: Not Available, missing data often found in statistical data sets
# - NULL: The value in question simply doesn't exist,
#         rather than being existent but unknown.
#         NULL values are counted as non-existent
#         NULL is a special R object with no mode

# Using NA
#
# In Manz of R"s statistical functions, we can instruct the function to skip
# over missing values or NAs.

x <- c(88, NA, 12, 168, 13)

mean(x) # NA
mean(x, na.rm = TRUE) # 70.25


# Vectorized if-then-else: The ifelse() Function
#
# ifelse(b,u,v)

ifelse(1:5 < 3, 0, 1)
