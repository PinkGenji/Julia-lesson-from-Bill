#The aim of this part is to understand the use of variables and functions.

#In julia, variable name is also called an identifier. An identifier may
#include any upper, lower letters, any digit, one underscore_ and one exclamation!
#But the first character in an identifier cannot be a digit or !.
#In addition, any Unicode characters can be used in a variable name:
α7= 0.7
escape_velocity=9.8

#A variable name with only of underscore_, can be a assigned a value and
#discarded immediately and cannot be used in subsequent expression.

#another special variable is ans, which takes the value of the most recent result
# in a REPL. For example:
8+3
x = 3+ans

#Like Python, Julia uses +=, -=, *= and /= for updating a variable:
x += x+1
#A semicolon can be used to supress the evaluation in the REPL:
x = 3*5.2e7;
#Semicolon can also be used to split two statement on the same line:
x = 5; y = x^2
#Power operation has higher priority than usual operations, e.g. times
2x^2
(2x)^2
2(x^2)

#Julia also identifies many Unicode characters. Including all Greeks:
λ=4
ξ=5
γ=6

#Special constants are pre-defined in Julia, and some of them have their
#own types: irrational{}, i.e.:
typeof(pi)
typeof(π)
typeof(ℯ)
#Indeed, they are special, even in Julia!
π
ℯ
#Julia will round π to a floating point value based on the types of the
#other variables and constants in the expression:
π+Float32(5)
#we can use big() to get the max precision representation:
big(π)

#Julia has a large standard library. We can use these modules to help:
using Dates
t = Date(1845,3,3)
dayname(t)

#If we use "import" like python, we will only import the module name
#available, but not the names taht the module exports:
import Dates
t = Dates.Date(1956,6,19)
Dates.dayname(t)
#Although 'using' is helpful, a name clash can occur when you use multiple
#modules. A programmer wanting to use both functions in the same program could 
#use the "import" command to distinguish them.
