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
