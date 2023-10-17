#This section is about how to create and manipulate vectors in Julia.

#Indexing...
#A small vector is created by listing its element using square brackets, sperated byu commas:
a = [2,-1,9,7]
length(a)
#The first element is indexed by "1" in Julia, if index is out of bound, Julia gives a BoundsError:
a[1]
a[5]
#The index "end" can be used for the last element.
a[end]
a[end-1]
#When slicing the vector, Julia returns the specified initial and end index elements.
a[1:3]
#We can also use jumping steps,[i:s:j], where s is called the stride.
#the last element returned is i+p*s, where p is the largest integer such that
#i+p*s is less than or equal to j. A reverse jump can be done with a negative stride.
b = [5,8,9,62,78,42,36,12,19,56]
b[2:3:9]
b[9:-3:2]
#similar to Python, the initial and last index can be ignored sometimes:
b[:7]
b[7:end]

#Vector Arithmetic...
c = [1,-1,3]
d = [0,5,9]
#Vector addition and scalr multiplication are element-wise:
c+d
3*c
# .* is defined as the element-wise multiplication, *+ is used to add a scalar to every element of a vector:
c .* d
d .+ 4
#Similarly, ./ and .- are used for division and subtraction, element-wise:
d ./ c
d .- 3 

#Like MATLAB, we can construct special vectors:
zeros(3) #is vector of length 3, with all elements being zero.
ones(3) #is a vector of length 3, with all elements being 1.0
fill(5,3) #is a vector of length 3, with all elements being 5.
rand(6) #is a vector of 6 random numbers, uniformly distributed on [0,1] 
randn(5) #is a vector of n random numbers, normally distributed with mean=0, variance = 1

#comprehension can be used in Julia to contruct a vector:
[k^2-1 for k = -1:4]
Float64[k^2-1 for k =-1:4]
#semicolon can be used to concatenate two vectors:
[c;d]
[(-1)^k for k = 0:5]

#In Julia, a vector is a container type and it is mutable:
x = [3,4,6,7,8,9]
x[3]=7;x
y = x #the vector y will reference the same storage as x, so any change on y also changes on x:
y[4] = 0
x
#To avoid this potential messy structure, we can use the copy() function:
y = copy(x)
y[1]=8; y
x
# Range indexing also creates a copy, with its own storage;
z = x[2:4]
z = x[:] # This has the same effect of using copy().
#Tuple is a another container type in Julia, a tuple is an ordered collection.
t = (2,-1,9,7)
length(t)
#But a tuple is immutable, the only way to change its element is by creatinga new tuple and assign it 
#to t, but we can still extract elements from a tuple and assign to a variable:
a = t[2]
b = t[1:3]
