#create an object with a left to right assignment order
x = 10
#object with right to left assignment order
3 -> y
#character
z = "dog"
class(z)
#numeric
class(x)
#integer
d = 4L
class(d)
#factor
purple = as.factor("purple")
class(purple)

#Using your numeric and integer objects, using the following operators: %%, ^, %/%
##y^x means y to the x power
y^x
##x%%y gives the remainder of x/y
x%%y
##y%/% means the dividend of x/y
x%/%y

#object with a sequence of 10 numbers
s = c(1:10)

#Create three objects that each have a number assigned to them. The code for all
#three objects must exists a single line in the script. Add code to print the values of
#those three objects.
{a=2; b=2; c=5}
a
b
c

a*b+c
a*(b+c)
#both equations are following the order of operations
##in the first, it does the multiplying first and then the addition
##in the second it does what's in the parenthesis first and then the multiplication

#Inf stands for infinity
3^1000
#-Inf stands for negative infinity
-3^999
#NaN stands for not a number
0/0
#NA stands for not available
e = c(1:10)
e[11]
#NULL

#create your own operator
'%myop%' = function(u,w){2^u +2^w}
1 %myop% 1

#if else statement
ies = function(g) 
{switch(g, s="octopus", t="squid", u="snail", v="slug")}
ies("s")

###################################

load("fish_data_1.Rdata")
nrow(fish)
ncol(fish)
print(fish$year)

str(fish)
#data types in fish are numeric(numbers), factor(category with levels), character(words/letters), 
##integer(whole numbers), POSIXct(calendar dates)

fish$area_chr = as.character(fish$area_fac)
class(fish$area_chr)

fish$avg.DNE.m = NULL
