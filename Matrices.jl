#We have worked with Vectors, now we will march on to Matrices.

#Creating Matrices...
#Consider the 3-by-4 matrix:
A = [2 0 -7 1
     5 9 3 -1
     4 1 0 -6]
#Alternatively, we can use one line to define a matrix:
A = [2 0 -7 1; 5 9 3 -1; 4 1 0 -6]
#Many functions from the section "Vector" are of course usable on matrices:
length(A)
size(A)
size(A,1) #Returns the number of rows.
size(A,2) #Returns the number of columns.

zeros(3,4) #Creates a 3-by-4 matrx, with all entries being zero.
ones(4,5) #creates a 4-by-5 matrix with all entries being one.
fill(13, 3, 2) #Creates a 3-by-2 matrix with all entris being 13.
rand(4, 7) #Creates a 4-by-7 matrix of random numbers, uniformly distributed in [0,1].
randn(2,3) #Creates a 2-by-3 matrix of random numbers, normally distributed with mean=0, variance=1

#We can also combine matrix just like R!
B = ones(3,3);
C = [A B];
size(C) #Since both A, B have 3-rows and in total, 4+3=7 columns.


