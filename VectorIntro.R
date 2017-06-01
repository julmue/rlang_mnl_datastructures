# -----------------------------------------------------------------------------
# VECTORS
#
# Vectors are the fundamental data type in R.
# - Individual numbers (scalars) do not have a separate data type 
#   but instead are special cases of vectors.
# - Matrices are special cases of vectors.

# Special Properties of R Vectors
# - Recycling
#   The automatic lengthening of vectors in certain settings
# - Filtering
#   The extraction of subsets of Vectors
# - Vectorization
#   Where functions are applied element-wise to vectors

# Properties of R Vectors
# - Vectors are homogenous data structures
#   R variable types are called modes. All elements in a vector must have the same mode. 


# -----------------------------------------------------------------------------
# Vector Construction: Adding Vector Elements
# It is not possible to insert or delete elements in a Vector.
# The size of a vector is determined at its creation;
# If you wish to add or delete elements you'll need to reassign the vector.

# example: Insert a number in a vector
x <- c(88,5,12,13)
x <- c(x[1:3], 168, x[4])

# Declaration of Vectors
# Empty Vectors must be declared before usage
v <- vector(length = 2)

# Generating Vectors with the : Operator
4:9

for (i in 1:length(x)) {
  # do something (with i)
}

# Generating Vector Sequences with seq()
seq(from = 0.1, to = 6.0, by = 0.2 )

seq(from = 5, to = 10, length = 17)

x <- 4:7
seq(x)
seq(NULL)

for (i in seq(x)) # better then for (i in 1:i)


# -----------------------------------------------------------------------------
# Repeating Vector Constants with rep()

rep(8,4)
rep(1:4,4)
rep(1:4, each = 4)
rep(1:4, each = 4, 2)

  
# -----------------------------------------------------------------------------
# Functions over Vectors and Vector Operations

# Length
x <- 1:3
length(x)


# -----------------------------------------------------------------------------
# Vector Arithmetic: 
# Vector Arithmetic is performed element-wise in R

# Addition
1:2 + 1:4

"+"(2,5)

2 + 5 # scalars are vectors, too

# Multiplication
5 * 1:5

# -----------------------------------------------------------------------------
# Vector Indexing
# Indexing a vector means forming a subvector by picking elements of the given vector
# for specific elements. The format is
#
#   vector1[vector2]
#
# with the result that we select those elements of vector1 whose indices are given in vector2.

x <- 3:8
x[2]
y <- 3:5
z <- x[y]


# duplicates are allowed
x <- 7:15
y <- x[c(3,3,3,5)]

# negative indexes means dropping a vector
x <- 7:15
y <- x[c(-1,-3)]
z <- x[-length(x)]

# -----------------------------------------------------------------------------
# Matrices
# Matrices are Vectors too; They merely have extra class attributs
# - Number of rows
# - Number of columns
#
# Everything that holds for vectors holds for matrices, too
# Example: the following 3x2 Matrix is stored as a 6-element Vector (column-wise by default)
m <- matrix(1:6, nrow = 3, ncol = 2) 
m + 10:15


# -----------------------------------------------------------------------------
# Recycling
# When applzing an operation to two vectors that require them to be the same length
# R automaticallz recycles (repeats) the shorter one until it is long enough to match the longer one.
# A warning message is raised if the longer object length is not a multiple of the shorter object length.

# example 1
c(1,2,3) + 1:5

# example 2
m <- matrix(1:6, nrow = 2)
m + 1:2


# -----------------------------------------------------------------------------
# all() and any()

all(T,T,T,T,F)
any(T,T,T,T,F)

all(2<1:3)
any(2<1:3)


# -----------------------------------------------------------------------------
# Vectorized Operations (Mapping a function over a vector)
#
# In many cases a function f can be applied to all elements of a vector x
# by calling the function on the vector itself: f(x)
#
# One of the most effective ways to achieve speed in R code is to use operations
# that are vecorized, meaning that a function applied to a vector is applied individually
# to each element.


# -----------------------------------------------------------------------------
# Filtering
#
# Filtering allows us to extract a vector's elements that satisfy certain conditions.
# Filtering is one of the most common operations in R,
# as statistical analysis often focus on data that satisfies conditions of interest.

# Generating Filtering Indices
# Filtering Indices keep NAs
z <- 1:8
z <- z[z %% 2 == 0]

# Filtering with the subset() Function
# Subset removes NAs
z <- 1:8
z <- subset(z, z %% 2 == 0 )


# -----------------------------------------------------------------------------
# Testing Vector Equality
#
# == doesn't work

all(x == z)
identical(x,y)


# -----------------------------------------------------------------------------
# Vector Element Names

x <- c(22,33,44)

# assign names
names(x) <- c("a","b","c")

# use names
x["b"]
x[c("a","c")]

# remove names
names(x) <- NULL

# -----------------------------------------------------------------------------
# Concatenation function: c()
# - c() casts
# - c() flattens: Vectors can't be nested







