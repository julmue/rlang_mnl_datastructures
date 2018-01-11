# library for excel import
library(readxl)


# setwd(getwd())



# -------------------------------------------------------------------------------------------------
# relative file paths
# relative file paths using 'file.path()'


# -------------------------------------------------------------------------------------------------
# Read XLSX Files
testdata <- read_excel(file.path(".", "testdata", "testdata.xlsx"))


# -------------------------------------------------------------------------------------------------
# Reading tables 
# * Reading text tables
#   The function read.table is the basis for all table text importing functions
#   and can be be configured to read all kinds 

# most important parameters 
t1 <- read.table(
  # filepath
  file = file.path(".", "testdata", "testdata.csv"), 
  
  # flag: file contains the names of the variables as the first row
  header = TRUE,
  
  # field separator character; for sep = "" the separator is whitespace
  sep = "",
  
  # set of quoting characters; to disable quoting use quote = ""
  quote = "\"",
  
  # character used in the file for decimal points
  dec = ".",
  
  # vector of row names
  row.names = NULL,
  
  # vector of optional column names
  # col.names = NULL
  
  # a character vector of strings to be interpreted as as NA values
  # blank fields are also considered to be missing values in logical,integer, numeric and complex fields
  na.strings = c("Name 7", "Name 9"),
  
  # a vector of classes to be assumed for the columns
  # possible values
  #   * NA:     Default 
  #   * NULL:   NULL
  #   * one of the atomic vector classes:
  #       logical, integer, numeric, complex, character, raw
  #   * factor
  #   * Date
  # otherwise there needs to be an as method (from package methods) for conversion from "character"
  # to the specified format class.
  colClasses = c(factor, integer, character),
  
  # the maximum number of rows to read in
  nrows = 10,
  
  # the number of lines of the data file to skip before beginning to read data
  skip = 2,
 
  # logical; used when sep as been specified 
  # allows the stripping of leading and trailing whitespace from unquoted character fields (numeric fields are always stripped) 
   
  # logical; skip true blank lines in input
  blank.lines.skip = TRUE,
  
  # comment char
  comment.char = "#",
  
  # logical; should character vectors be converted to factors?
  # note: is overwritten by "as.is" and "colClasses"
  stringsAsFactors = FALSE
)




testdata_csv <- read_csv(NULL)
