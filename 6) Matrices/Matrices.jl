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
B2 = ones(3,4);
D = [A;B2]
#Alternatively, we can use hcat() and vcat():
C2 = hcat(A,B2)
D2 = vcat(A,B2)
#Julia treats the Vector types as a column vector, both of the following expression are column vector.
v = [2, -1, 9, 7]
v=[2;-1;9;7]
#whereas v = [2 -1 9 7] is a row vector, or 1-by-4 matrix:
v = [2 -1 9 7]

#Indexing...
#The element of A in row i, column j is referred as A[i,j] and is said to have row index i and column index j:
E = [9 2 5 0 -4
     7 0 1 -3 8
     1 4 -6 2 2
     6 -3 -4 1 1]
E[3,4]
E[2,5]
#We can also extract sub-matrix:
E[2:4, 3:4]
#Similarly, we can use the index to extract a whole row/column of a matrix:
E[:,3] #The whole column-3 of matrix element
E[2,:] #The whole row-3 of matrix element
#Comprehension (syntax of set-builder from math) can also be used in Matrix in Julia:
H = [1//(2i+j) for i=1:4, j = 1:4]
v = collect(1:12) #Regenerates a colum vector from 1 to 12.
A = reshape(v, 3, 4) # reshape() rearranges the matrix into a new dimension.
#Note: v and A reference the same storage locations in the computer memory, changing one of them will affect the other.
A[4] = -4; A #By this, we know Julia is 'column first' when enumerate entries in a matrix.
v[4]

#Matrix Arithmetic...
#Scalar multiplication is:
2*B
#Matrix multiplication (Make sure check dimensions):
L = fill(3,3,3)
M = fill(6,3,3)
L * M
#As usual, dot syntax performs element-wise multiplication:
L .* M

#Linear system...
#Consider the following linear system of Ax=b:
A = [5 1 2
     -2 9 4
     3 1 8]
b = [17; -11; 43]
#The backslash operator \ performs a left division, that is, A\b = A^-1 b, where the inverse of A is not explicitly computed.
#Instead, an LU factorization of A was performed. The expression A\B evaluates for any matrix with size(B,1), i.e. rows equal to n.
x = A\b

#Eigenproblems...
#We need the module "LinearAlgebra" for the functions needed to solve problems in linear algebra.
using LinearAlgebra
B = [3 -1 4
     5 2 6
     -9 1 7]
#eigen() creates an Eigen object F for which F.values is the vector of eigenvalues:
F = eigen(B)
F.values
F.vectors
#The kth column of F.vector is the eigen vector corresponding to the eigenvalue F.values
#i.e. F.vector[:,k] corresponds to the eigenvalue, F.values[k]

#Dot syntax...
#We can construct a matrix D with same size and same element type of A:
D = similar(A)
#But the values of the elements of D are unpredictable. Julia just allocates storage to hold the elements, without worrying about the current contents of that storage.
#If we use dot syntax, the nthe contents of A are copied to D, since A and D do not share the same storage, changes on one of them will not affect the other:
D .= A
