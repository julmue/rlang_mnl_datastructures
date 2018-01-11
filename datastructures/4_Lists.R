# -----------------------------------------------------------------------------
# Lists
# In contrast to homogenous vectors (same mode for every element) 
# lists are heterogenous (differnt modes for different elements possible)
# Lists are central to R and form the basis to Data-Frames and OOP.

# Creation of lists
# "Normal" Vectors: Atomic Vectors - their components cannot be broken down in smaller elements
# Lists: Recursive Vectors


# List Creation

## Creating lists with the list() function
list("Joe", 55000, TRUE)

## List elements can be named (names are called "tags" in R)
# Whenever possible use names instead of numeric indices
list(name = "Joe", salary = 55000, union = TRUE)

# since lists are vectors they can be created using vecor()
l <- vector(mode = "list" )
l[["tag"]] <- 666
l$tag
#> 666


# List Access
l <- list(tag1 = TRUE, tag2 = "two", tag3 = 3)

## List access via indexing
l[[1]]
#> TRUE
mode(l[[1]])
#> logical


## List access via tags and double brackets return in the datatype of the element
l$tag1
#> TRUE
mode(l$tag1)
#> logical

l[["tag1"]]
#> TRUE
mode(l[["tag1"]])
#> logical


## List access via index or tags and single brackts return a sublist
l[1]
#> TRUE
mode(l[1])
#> list

l["tag1"]
#> TRUE
mode(l["tag1"])
#> list

# returns a sublist
l[2:3]

l[c("tag1","tag2")]


## Adding list elements
l <- vector(mode = "list")

## via indices
l[3:5] <- c(FALSE, TRUE, TRUE)

## via tags
l$a <- "sailing"
l$b <- 42


## Deleting list elements
# List elements get deleted by setting them to NULL
l[3:5] <- NULL


l$a <- NULL



## List concatenation
c(list("XXX", 1, TRUE), list(TRUE, 42))


## size of a list
l <- list(1,2,3,4,5)

length(l)
#> 5


## Accessing list components 

# if list elements have names they can be accessed via the names() function
l <- list(name = "Joe", salary = 55000, union = TRUE)

names(l)
#> "name" salary" "union"


# obtain values via unlist()
# this function casts to the highest common base type -> strings as the highest denominator 

l <- list(name = "Joe", salary = 55000, union = TRUE)

unlist(l)
#> name    salary    union 
#> "Joe"   "55000"   "TRUE"
l <- list(tag1 = 1, tag2 = 2, tag3 = 3)
unlist(l)


## Applying functions to a list
# * lapply(): list apply 
# * lapply(): 

# lapply(): call a function for each element of a list
l <- lapply(list(1:3, 13:27), median)
#> [[1]]
#> [1] 2
#> [[2]]
#> [1] 20
mode(l)
#> "list"

# sapply(): call a function for each element of a list and simplify the result to a vector or matrix
l <- sapply(list(1:3, 13:27), median)
#> 2 20
mode(l)
#> "numeric"

# Recursive lists
# lists can be recursive
a <- list("abc", 1:3)
b <- list(TRUE, 42)
c <- list(a,b) # list of two lists

# lists can be flattenend
d <- c(a,b, recursive = TRUE)
mode(d) 
#> "list"
length(d)
#> 5
