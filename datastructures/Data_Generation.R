# -----------------------------------------------------------------------------
# Vectors
# Types in R: modes
# modes: numeric, character, boolean


## Data Generation for the elemental modes in R
# check the mode of a datastructure with the "mode(x)" command

# The concatenation function c()
# c concatenats data elements with the same modes to vectors
x <- c(1,3) 
c(c(2,4),x)

### Generating Vectors with the : Operator
# The (:) operator produces a vector consisting of a range of numbers.
# "numeric" mode only 
x <- 1:9


## Generating Vector Sequences with seq()
# Generalization of (:): generates a sequence in arithmetic progression
# "numeric" mode only
seq(from = 0.1, to = 6.0, by = 0.2 )

seq(from = 5, to = 10, length = 17) # 17 Numbers with same distance



## Mode-Independent Data Generation Functions
# The rep() function repeats vector constants
# mode independent

rep(8,4) 
#> 8 8 8 8 

rep(1:2, 2)
#> 1 2 1 2 

rep(1:2, each=4)
#>  1 1 2 2

rep(1:2, each=2, 2)
#> 1 1 2 2 1 1 2 2



# -----------------------------------------------------------------------------
# Matrices
# Matrices are vectors with two extra class attributes: nrow, ncol

m <- matrix(1:6, nrow=3, ncol=2) 

m <- matrix(1:9, nrow=3)
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9

m <- matrix(1:9, nrow=3, byrow=TRUE)
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    4    5    6
#> [3,]    7    8    9

# -----------------------------------------------------------------------------
# Random Data

# take a random sample of size 50 from a dataset mydata
# sample without replacement
mysample <- mydata[sample(1:nrow(mydata), 50,
                          replace=FALSE),] 