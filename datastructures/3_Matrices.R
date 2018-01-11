# -----------------------------------------------------------------------------
# Matrices
#
# A matrix is a vector with two additional attributes:
# - nrow: number of rows
# - ncol: number of columns
#
# Matrices are homogenous like vectors
# Matrices are special cases of a more general R type of object: arrays
# Arrays can be multidimensional
#
# Much of R's power comes from the various operations you can perform
# on matrices.


# -----------------------------------------------------------------------------
# Creating matrices
# - Matrix row and column subscripts begin with 1:
#   The upper left corner of the matrix m is denoted m[1,1]
# - The internal storage of a matrix is in column-major order,
#   meaning that first all of column 1 ist stored, then all of column 2, ...

# creating matrices with the matrix function
m <- matrix(1:6, ncol = 2)
#       [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6

m <- matrix(1:6, nrow = 2)
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

# row-major order is possible
m <- matrix(1:6, ncol = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# [3,]    5    6

m <- matrix(nrow = 2, ncol = 2)
m[1,1] <- 1 # unassigned values are NAs by default
m[1,2] <- 2
m[2,1] <- 3
m[2,2] <- 4


# -----------------------------------------------------------------------------
# Matrix Indexing

m <- matrix(1:16, ncol = 4, nrow = 4)
m[1,]   # first row
m[2:3,] # second and third column
m[,1]   # first column
m[,2:3] # second and third column
m[c(1,3),c(2,4)]


# values can be assigned to submatrices
m <- matrix(1:16, ncol = 4)
m[c(2,3),c(2,3)] <- matrix(88, ncol = 2)
#       [,1] [,2] [,3] [,4]
# [1,]    1    5    9   13
# [2,]    2   88   88   14
# [3,]    3   88   88   15
# [4,]    4    8   12   16

# negative values work as well
m <- matrix(1:16, ncol = 4)
m <- m[-c(2,3),]
#      [,1] [,2] [,3] [,4]
# [1,]    1    5    9   13
# [2,]    4    8   12   16


# -----------------------------------------------------------------------------
# Matrix Filtering

m <- matrix(1:16, ncol = 4)
m <- m[m[,2] >= 7,] 
#     [,1] [,2] [,3] [,4]
# [1,]    3    7   11   15
# [2,]    4    8   12   16


# -----------------------------------------------------------------------------
# Applying Function to Matrix Rows and Columns
#
# One of the most famous and most used feature of R is the apply() family of functions
# - apply()
# - tapply()
# - lapply()

# apply() calls a user-specified function on
# - each of the rows or
# - each of the columns of a matrix

# apply(m, dimcode, f, fargs)
# - m is the matrix
# - dimcode: 1 for rows, 2 for columns
# - f: function to be applied
# - fargs: optional set of arguments to be supplied to f

m <- matrix(1:16, ncol = 4)
apply(m,1,mean) # dimcode 1: apply to every row 
apply(m,2,mean) # dimcode 2: apply to every column


# -----------------------------------------------------------------------------
# Adding and Deleting Matrix Rows and Columns
#
# Technically matrices are of fixed length and dimensions
# so we cannot delete rows or columns.
# Matrices can be reassigned thus we can achieve the same effect 
# as if we had directly done additions or deletions.


# rbind() and cbind(): Adding rows and columns 
rbind(rep(666,4), matrix(1:16, ncol = 4)) # add new first row
rbind(matrix(1:16, ncol = 4), rep(666,4)) # add new last row

cbind(rep(666,4), matrix(1:16, ncol = 4)) # add new first column
cbind(matrix(1:16, ncol = 4), rep(666,4)) # add new last column


# -----------------------------------------------------------------------------
# Matrix Vector Distinction

# The length of the underlying vector can be taken
m <- matrix(1:16, ncol = 2)
length(m)
#> 16

attributes(m) # 8 rows, 2 columnes
#> 8 2 

# -----------------------------------------------------------------------------
# Naming Matrix Rows and Columns

m <- matrix(1:4, ncol = 2)
colnames(m) <- c("a","b")
rownames(m) <- c("c","d")

colnames(m)
rownames(m)
