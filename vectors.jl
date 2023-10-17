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