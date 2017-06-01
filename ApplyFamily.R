# sapply(x,f)
#
# sapply applies the function f() to each element of x and then 
# converts the result to a matrix

sapply(1:8, function(x) c(x,x^2, x^3, x^4) )

# [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,]    1    2    3    4    5    6    7    8
# [2,]    1    4    9   16   25   36   49   64
# [3,]    1    8   27   64  125  216  343  512
# [4,]    1   16   81  256  625 1296 2401 4096