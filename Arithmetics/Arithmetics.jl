#Use typeof() to check the type of an object:
typeof(64)
#Use supertype() and subtype() to check for other possible types.
supertype(Int64)
subtypes(Real)
#Julia uses Inf as infinite:
typemax(Float64)
#and NaN is used in Julia for "not a number", this means the calculation is meaninngless no matter finite or infinite.
0.0/0.0

#By default, Julia promotes each Int64 to its corresponding Float64 value:
3+1/2
#Division is unusual, because its result can have different type than operand:
#The result is Float64 even if both operand are Int64:
8/4
# div() returns quotient and divrm() returns quotient and remainder:
div(7,2)
divrem(7,2)

# operator: // is used to contruct rational numbers:
x = 3//4
typeof(x)
#A rational number is essntial a pair of numbers, .num and .den can be used:
x.num
x.den
#Julia automatically simplifies the fractions:
y = 7//21
5//13 - 19//2 +7

#Logarithm:
#the default base of log in Julia is e:
log(ℯ)
#We can use log(b,x) to specify a particular base:
log(2,2)
log(10,100)

#Complex numbers...
#Same as rational numbers, Complex numbers can be seen as a pair of numbers:
z = 3.2-7.2im
#We use .re to refer the real part and .im for the imaginary part:
z.re
z.im
#The abs and angle functions give the modulus and argument(phase) of a complex number:
abs(z)
angle(z)

#We need to rationalize to approximate the fraction form in some case:
a = 17.1 +20.3
b = 36.5+41.8
a//b
a/b
rationalize(a/b)
