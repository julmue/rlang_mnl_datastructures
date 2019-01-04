library(stringr)

# Strings
# character vectors

# -------------------------------------------------------------------------------------------------
# Vanilla R functions

# number of characters

nchar("Hello world!")
# > 12


# search regular expressions
grep("Hell", c("Hello world!", "This and that", "Hello me!"))
# > 1 3


# concatenate strings
paste("Hello", "world!")
# > "Hello world!"

paste("Hello", "world!", sep = "-")
# > "Hello-world!"


# get substring
substr("one two three", 5, 7)


# split strings
strsplit("abc-def-ghi", split="-")
# > "abc" "def" "ghi"


# get begin of first hit of regular expression
regexpr("def","abcdefghi")


# -------------------------------------------------------------------------------------------------
# stringr

str_sub("abracadabra", 3, 5)


x <- "BBCDEF"
str_sub(x, 1, 1) <- "A"

x <- "BBCDEF"
str_sub(x, 1, 1) <- "AHA"


# -------------------------------------------------------------------------------------------------
# regular expressions with stringr

# str_view needs the htmlwidgets package
x <- c("apple", "banana", "pear")
str_view(x, "an")

