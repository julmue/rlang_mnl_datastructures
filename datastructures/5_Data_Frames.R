# Data Frames
# A data frame is like a matrix with a two dimensional rows-and-columns structure;
# It differs from a matrix in that each column can have a different mode
#               1 dim      2 dim
# homogenous    vector <-> matrix
# heterogenous  list   <-> data frame
#
# On a technical level a dataframe is a list with the components of the list 
# being equal length vectors (or even other dataframes - this is rare)

# -----------------------------------------------------------------------------
## Creating Data-Frames
kids <- c("Jack", "Jill")
ages <- c(12,14)

df <- data.frame(kids,ages, stringsAsFactors = FALSE)
#    kids ages
#> 1 Jack   12
#> 2 Jill   14


# -----------------------------------------------------------------------------
## Accessing Data-Frames
# Index: Since data frames are lists we can access them via index
df[[1]]
#> [1] "Jack" "Jill"
df[[2]]
#> [1] 12 14

# Component names
df$kids
df$ages


## Accessing matrix-style
df[1,]
#> 1 Jack   12
df[2,]
#> 2 Jill   14

df[,1]
#> "Jack" "Jill"
df[,2]
#> 12 14

## Matrix-like operations: extracting subdata frames
df <- data.frame(color = c("red", "blue", "green"),
                 car = c("camaro", "honda", "toyota"),
                 cost = c(10000, 20000, 30000),
                 stringsAsFactors = TRUE)

# first two datasets third column                 
df[1:2,3]


# -----------------------------------------------------------------------------
# Analyzing the Properties of Data-Frames
# * str(): Compactly display the structure of an arbitrary R Object

str(df) 
#> 'data.frame':	2 obs. of  2 variables:
#> $ kids: chr  "Jack" "Jill"
#> $ ages: num  12 14

## number of rows
nrow(df)

## number of columns
ncol(df)

# -----------------------------------------------------------------------------
## Combining Data-Frames

### Adding rows: rbind()
# The rbind() matrix function is used to add rows (as lists or data-frames) 
# with the same structure to a data-frame.

kids1 <- data.frame(names = c("Harry", "Sally"), 
                    ages = c(12, 15))
kids2 <- data.frame(names = c("Bonny", "Clyde"), 
                    ages = c(4, 6))

kids <- rbind(kids1, kids2)

#### Generalization using Reduce()
# Reduce(rbind, list_of_data_frames)

kids3 <- data.frame(names = c("Harry", "Hermione"), 
                    ages = c(14, 15))

kids <- Reduce(rbind, list(kids1, kids2, kids3))


### Adding colums: cbind()
# The cbind() matrix function is used to add columns (as lists or data-frames)
# of the same length to a data-frame.

cars <- data.frame(model = c("Civic", "A3", "Escort"),
                   manufacturer = c("Honda", "Audi", "Ford"))
colors <- data.frame(color = c("Blue", "Purple", "Yellow"))

cars <- cbind(cars, colors)


# -----------------------------------------------------------------------------
### Computed Rows
# it is also possible to create new columns based on old ones.

exams <- data.frame(exam1 = c(1.0, 2.4, 3.3), 
                    exam2 = c(5.0, 4.0, 2.2))

eq <- cbind(exams, diff = exams$exam1 - exams$exam2)
# Alternative:
eq <- exams
exams$diff <- exams$exam1 - exams$exam2


# -----------------------------------------------------------------------------
## Merging / Joining Data-Frames
# In the relational database world one of the most important operations 
# is that of a 'join' in which two tables can be combined according 
# to the values of a common variable (common variables)

df1 = data.frame(CustomerId = c(1:6), 
                 Product = c(rep("Toaster", 3), rep("Radio", 3)))

df2 = data.frame(CustomerId = c(2, 4, 6, 7), 
                 State = c(rep("Alabama", 2), rep("Ohio", 2)))

inner <- merge(df1, df2, by = "CustomerId")
# CustomerId   Product     State
#          2   Toaster   Alabama
#          4     Radio   Alabama
#          6     Radio      Ohio

outer <- merge(df1, df2, by = "CustomerId", all = TRUE)
# CustomerId   Product     State
#          1   Toaster      <NA>
#          2   Toaster   Alabama
#          3   Toaster      <NA>
#          4     Radio   Alabama
#          5     Radio      <NA>
#          6     Radio      Ohio
#          7      <NA>      Ohio

left_outer <- merge(df1, df2, by = "CustomerId", all.x = TRUE)
# CustomerId   Product     State
#          1   Toaster      <NA>
#          2   Toaster   Alabama
#          3   Toaster      <NA>
#          4     Radio   Alabama
#          5     Radio      <NA>
#          6     Radio      Ohio

right_outer <- merge(df1, df2, by = "CustomerId", all.y = TRUE)
# CustomerId   Product     State
#          2   Toaster   Alabama
#          4     Radio   Alabama
#          6     Radio      Ohio
#          7      <NA>      Ohio

cross <- merge(df1, df2, by = NULL)
# CustomerId.x  Product CustomerId.y  State
#             1 Toaster            2 Alabama
#             2 Toaster            2 Alabama
#             3 Toaster            2 Alabama
#             4   Radio            2 Alabama
#             5   Radio            2 Alabama
#             6   Radio            2 Alabama
# ...

### Merging more than one column
merge(x=df1, y=df2, 
      by.x=c("x_col1","x_col2"), 
      by.y=c("y_col1","y_col2"))

### Merging by columns with different names
df1 <- data.frame(kids = c("Harry", "Sally"), 
                  ages = c(12, 15))
df2 <- data.frame(pals = c("Harry", "Sally"), 
                  states = c("CA", "WI"))
df <- merge(df1, df2, by.x = "kids", by.y = "pals")

#  kids  ages  states
# Harry    12      CA
# Sally    15      WI

# -----------------------------------------------------------------------------
## Applying Functions to Data Frames
# lapply() with a function applies the function to every column

df <- data.frame(x=c(1,2), y=c(3,4), z=c(5,6))
# x y z
# 1 3 5
# 2 4 6

# apply function to every column of a data frame
data.frame(lapply(df, rev))
# x y z
# 2 4 6
# 1 3 5

# apply functionj to every row of a data frame
data.frame(apply(df, 1, sum)) 



# -----------------------------------------------------------------------------
### Setify / remove duplicate entries from dataframe
# The unique() function for vectors and lists works with data-frames as well

df1 <- data.frame(kids = c("Harry", "Harry", "Sally"), 
                  ages = c(12, 12, 15))

df1 <- unique(df1)
#  kids   ages
# Harry     12
# Sally     15


# -----------------------------------------------------------------------------
### Sorting / Ordering a dataframe
# The sort() function only sorts a vector
# To order the data in a data-frame order() has to be used

# Ascending
with(mtcars, mtcars[order(mpg),])
# Descending
with(mtcars, mtcars[order(-mpg),])
# By two or more columns
with(mtcars, mtcars[order(cyl,-gear),])


# -----------------------------------------------------------------------------
### Subsetting a dataframe
subset(mtcars, cyl == 4)

subset(mtcars, cyl == 4 & gear == 5)
subset(mtcars, cyl == 4 & gear == 5, select = c(mpg,cyl,hp))

subset(mtcars, cyl == 4 | cyl == 8)

with(mtcars, mtcars[cyl %in% c(6, 8),])

with(mtcars, mtcars[!(cyl %in% c(6, 8)),])

subset(mtcars, 
       cyl %in% c(4,8), 
       select = c(mpg,cyl,hp))

# -----------------------------------------------------------------------------
## Misc Operations and Functions
