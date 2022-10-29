###Module 1.1

getwd()

# Intro to R Lesson
# Feb 16th, 2016

# Interacting with R

#I am adding 3 and 5. R is fun!
3+5

x <- 3

y <- 5

y

x+y

number <- x + y

##### Exercises: ##### 

#1.Try changing the value of the variable x to 5. What happens to number?

x <- 5 #number stays the same at 8

#2.Now try changing the value of variable y to contain the value 10. What do you need to do, to update the variable number?

y <- 10
  #In order to change the variable (number), you must rerun the expression (number <- x + y) after changing its variables.

######################

###Module 1.2

glengths <- c(4.6, 3000, 50000)
glengths

species <- c("ecoli", "human", "corn")
species

#### Exercises: ######

#1. Try to create a vector of numeric and character values by combining the two vectors that we just created (glengths and species).Assign this combined vector to a new variable called combined. Hint: you will need to use the combine c() function to do this.

combined <- c(glengths, species)

#2. Print the combined vector in the console, what looks different compared to the original vectors?

combined #The original elements in the glength vector were converted from integers to character types.

#######################

expression <- c("low", "high", "medium", "high", "low", "medium", "high")

expression <- factor(expression)

#### Exercises #########

#Let’s say that in our experimental analyses, we are working with three different sets of cells: normal, cells knocked out for geneA (a very exciting gene), and cells overexpressing geneA. We have three replicates for each celltype.

  #1. Create a vector named samplegroup with nine elements: 3 control (“CTL”) values, 3 knock-out (“KO”) values, and 3 over-expressing (“OE”) values.

        samplegroup <- c("CTL", "KO", "OE", "OE", "CTL", "KO", "CTL", "OE", "KO")
  
  #2. Turn samplegroup into a factor data structure.
  
        samplegroup <- factor(samplegroup)
        
########################

# Create a data frame and store it as a variable called 'df'
        
df <- data.frame(species, glengths)
df        
        
#### Exercise: ############

#Create a data frame called favorite_books with the following vectors as columns:

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")

pages <- c(453, 432, 328)

favorite_books <- data.frame(titles, pages)

############################

list1 <- list(species, df, number)

list1

###### Exercise ############

#Create a list called list2 containing species, glengths, and number.

list2 <- list(species, glengths, number)
list2

###########################

#Module 1.3

glengths <- c(glengths, 90) # adding at the end	

glengths <- c(30, glengths) # adding at the beginning

sqrt(81) #Let’s try finding the square root of 81

sqrt(glengths) #Now what would happen if we called the function (e.g. ran the function), on a vector of values instead of a single value?

round(3.14159) #arguments that change the behavior of the function)

?round #Doing this will open up the help manual in the bottom right panel of RStudio that will provide a description of the function, usage, arguments, details, and examples

args(round) #Alternatively, if you are familiar with the function but just need to remind yourself of the names of the arguments, you can use:

example("round") #This will allow you to run the examples section from the Online Help to see exactly how it works when executing the commands.

round(3.14159, digits=2) #we can change the number of digits returned by adding an argument.

###### Exercise: ###########

#1. Let’s use base R function to calculate mean value of the glengths vector. You might need to search online to find what function can perform this task.

mean(glengths)

#2. Create a new vector test <- c(1, NA, 2, 3, NA, 4). Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the test vector. The output should be 2.5.

test <- c(1, NA, 2, 3, NA, 4)

mean(test, na.rm=TRUE)

#3. Another commonly used base function is sort(). Use this function to sort the glengths vector in descending order.

sort(glengths, decreasing = TRUE)

################################

#This function will take in a numeric value as input, and return the squared value.
square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5) #Now, we can use this function as any other base R functions

######### Exercise: ################

#Write a function called multiply_it, which takes two inputs: a numeric value x, and a numeric value y. The function will return the product of these two numeric values, which is x * y. For example, multiply_it(x=4, y=6) will return output 24.

multiply_it <- function(x,y) {
  product <- x * y
  return(product)
}

multiply_it(4,6)

##############

#Module 1.4

#Let’s bring in the metadata file we downloaded earlier (mouse_exp_design.csv or mouse_exp_design.txt) using the read.csv function.

?read.csv

metadata <- read.csv(file="data/mouse_exp_design.txt")

####### Exercise ############

#1. Download this tab-delimited .txt file and save it in your project’s data folder.



#2. Read it in to R using read.table() with the approriate arguments and store it as the variable proj_summary. To figure out the appropriate arguments to use with read.table(), keep the following in mind:
  # all the columns in the input text file have column name/headers
  # you want the first column of the text file to be used as row names (hint: look up the input for the row.names = argument in read.table())
#3. Display the contents of proj_summary in your console

proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)

###########################

head(metadata)

####### Exercise ############

#Use the class() function on glengths and metadata, how does the output differ between the two?

class(glengths)
class(metadata)

  #Use the summary() function on the proj_summary dataframe, what is the median “rRNA_rate”?

      summary(proj_summary)
      
  #How long is the samplegroup factor?
      
      length(samplegroup) #9
      
  #What are the dimensions of the proj_summary dataframe?
      
      dim(proj_summary)   #9 rows x 8 columns
      
  #When you use the rownames() function on metadata, what is the data structure of the output?
      
      rownames(metadata)  #character type vector
      
  #[Optional] How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.

      length(colnames(proj_summary)) # 8
      
#Module 2.1:
      
#Let’s start by creating a vector called age:
      
age <- c(15, 22, 45, 52, 73, 81)

#Suppose we only wanted the fifth value of this vector, we would use the following syntax:

age[5]

#If we wanted all values except the fifth value of this vector, we would use the following:

age[-5]

#If we wanted to select more than one element we would still use the square bracket syntax, but rather than using a single value we would pass in a vector of several index values:

age[c(3,5,6)]   # nested

#or

idx <- c(3,5,6) # create vector of the elements of interest
age[idx]

#Let’s select the first four values from age:

age[1:4]

########### Exercise ##############

#1. Create a vector called alphabets with the following letters, C, D, X, L, F.

alphabets <- c("C", "D", "X", "L", "F")

alphabets


#2. Use the associated indices along with [ ] to do the following:
    #only display C, D and F
        
alphabets[c(-3, -4)]

    #display all except X

alphabets[-3]

    #display the letters in the opposite order (F, L, X, D, C)

alphabets[5:1]

###################################

#We can use logical expressions to determine whether a particular condition is true or false.

age

#If we wanted to know if each element in our age vector is greater than 50, we could write the following expression:

age > 50

#Select all values in the age vector over 50 or age less than 18:

age > 50 | age < 18

age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select

idx <- age > 50 | age < 18
age[idx]

#Indexing with either method generates the same results, and personal preference determines which method you choose to use

which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

#Let’s extract the values of the factor with high expression, and let’s using nesting here:

expression[expression == "high"]    ## This will only return those elements in the factor equal to "high"

######## Exercise #########

#Extract only those elements in samplegroup that are not KO (nesting the logical operation is optional).

idx <- samplegroup != "KO"
samplegroup[idx]

###############################

#To view the integer assignments under the hood you can use str():

expression

str(expression)

#To relevel the categories, you can add the levels argument to the factor() function, and give it a vector with the categories listed in the required order:

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)

######### Exercise ###########

#Use the samplegroup factor we created in a previous lesson, and relevel it such that KO is the first level followed by CTL and OE.

samplegroup

str(samplegroup)

factor(samplegroup, levels = c("KO", "CTL", "OE"))

####################################

#Module 2.2

#You can check what libraries are loaded in your current R session by typing into the console:

sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages

#Packages for R can be installed from the CRAN package repository using the install.packages function.

install.packages("ggplot2")

#Once you have the package installed, you can load the library into your R session for use.

library(ggplot2)

######## Exercise ##################

#The ggplot2 package is part of the tidyverse suite of integrated packages which was designed to work together to make common data science operations more    user-friendly. We will be using the tidyverse suite in later lessons, and so let’s install it. NOTE: This suite of packages is only available in CRAN.

install.packages("tidyverse")

###########################

#Module 2.3

#Let’s say we wanted to extract the wild type (Wt) value that is present in the first row and the first column.

metadata[1, 1]

# Extract value 'Wt'

metadata[1, 1]

# Extract value '1'

metadata[1, 3] 

# Extract third row

metadata[3, ] 

# Extract third column

metadata[ , 3]  

# Extract third column as a data frame

metadata[ , 3, drop = FALSE] 

# Dataframe containing first two columns

metadata[ , 1:2] 

# Data frame containing first, third and sixth rows

metadata[c(1,3,6), ] 

# Extract the celltype column for the first three samples

metadata[c("sample1", "sample2", "sample3") , "celltype"] 

# Check column names of metadata data frame

colnames(metadata)

# Check row names of metadata data frame

rownames(metadata)

# Extract the genotype column

metadata$genotype 

# Extract the first five values/elements of the genotype column

metadata$genotype[1:5]

################ Exercise ############

#Return a data frame with only the genotype and replicate column values for sample2 and sample8.

metadata[c("sample2", "sample8"), c("genotype", "replicate")] # or
metadata[c(2,8), c(1,3)]

#Return the fourth and ninth values of the replicate column.

metadata$replicate[c(4,9)] # or
metadata[c(4, 9), "replicate"]


#Extract the replicate column as a data frame.

metadata[, "replicate", drop = FALSE]

##########################################

#Identify which rows in the celltype column have a value of typeA.
#Use those TRUE values to extract those rows from the data frame.

metadata$celltype == "typeA"

#We can save these values to a variable, which we can call whatever we would like; let’s call it logical_idx.

logical_idx <- metadata$celltype == "typeA"

#Now we can use those TRUE and FALSE values to extract the rows that correspond to the TRUE values from the metadata data frame.

metadata[logical_idx, ]

#Selecting indices with logical operators using the which() function

which(metadata$celltype == "typeA")

#We can save our indices for which rows the logical expression is true to a variable we’ll call idx, but, again, you could call it anything you want.

idx <- which(metadata$celltype == "typeA")

#Then, we can use these indices to indicate the rows that we would like to return by extracting that data as we have previously, giving the idx as the rows that we would like to extract, while returning all columns:

metadata[idx, ]

#Extract the rows of the metadata data frame for only the replicates 2 and 3.

which(metadata$replicate > 1)

#Now, we can save those indices to a variable and use that variable to extract those corresponding rows from the metadata table.

idx <- which(metadata$replicate > 1)

metadata[idx, ]

#Alternatively, instead of doing this in two steps, we could use nesting to perform in a single step:

metadata[which(metadata$replicate > 1), ]

#Let’s save this output to a variable called sub_meta:

sub_meta <- metadata[which(metadata$replicate > 1), ]

############ Exercise ###############

#Subset the metadata dataframe to return only the rows of data with a genotype of KO.

idx <- which(metadata$genotype=="KO")

metadata[idx, ]

####################################

# Let’s use the list1 that we created previously, and index the second component:

list1[[2]]

#With the class function we can check if that is what we retrieve:

comp2 <- list1[[2]]

class(comp2)

#You can also reference what is inside the component by adding an additional bracket.

list1[[1]]

#Now, if we wanted to reference the first element of that vector we would use:

list1[[1]][1]


############ Exercise #############

#Create a list named random with the following components: metadata, age, list1, samplegroup, and number.

random <- list(metadata, age, list1, samplegroup, number)

#Extract the samplegroup component.

random[[4]]

##################################

#Let’s check and see if the list1 has names for the components:

names(list1) 

#Let’s assign the original names to the components. 

# Name components of the list
names(list1) <- c("species", "df", "number")

names(list1)

#To extract the df dataframe from the list1 list:

# Extract 'df' component
list1$df
  
############ Exercise ###########

#Let’s practice combining ways to extract data from the data structures we have covered so far:
#Set names for the random list you created in the last exercise.

names(random) <- c("metadata", "age", "list1", "samplegroup", "number")

#Extract the age component using the $ notation

random$age






























