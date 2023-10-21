
#This aim of this lesson is to learn how to read from and write to files via Julia.

"""Some very useful command lines:
pwd(), show current working directory
readdir(), show all files name
cd("Filename"), set the working directory as "Filename"
cd(pwd,"..") move to the parent directory
"""

#The text file quote.txt contains an extract from the book Progress and Poverty.
#open the file by:
io = open("quote.txt","r") #It opens the file and creates an IOStream object io, "r" means read-only.
#readline() reads one line of a text file, the following code reads two lines and print them:
line1 = readline(io);
line2 = readline(io);
print(line1, '\n', line2)
#seek() causes io to read from the offset provided, the following code reads a line of text starting from just after the 11th byte in the file:
seek(io, 11)
readline(io)
#A common usage of seek() is seek(io,0) that rewinds to the start of the file.

#eachline() returns an iterator that allows the file to be processed line-by-line in a for-loop.
#Let's first rewind to the start of the file:
seek(io,0)
for line in eachline(io)
    println(line)
end

#We can also print the first word in each line:
seek(io,0)
for line in eachline(io)
    word_list = split(line)   #every word in line is splited
    if length(word_list) == 0   #We have to allow blank line, which the returned vector is [], length zero and word_list[1] would throw a BoundsError.
        println()
    else
        println(word_list[1])
    end
end
#Here, split() splits the string line at every space, returning a vector whose kth element is the kth word in the line.
#We have to allow for blank lines for which the vector is [] that has length zero and so attempting to access word_list[1] would throw a BoundsError.
close(io) #When finished reading from a file, we must close the IO stream.

"""
We can also pass a function argument to open:

x = open(f, "somefile.txt.","r")

is equivalent to:

io = open("somefile.txt","r")
x = f(io)
close(io)

The later usage has the advantage that we do not risk forgetting to close the IO stream.
Typically, we do not create a named function but just use a do-construct:

number_of_words = open("quote.txt", "r") do io
    n = 0 
    for line in eachline(io)
        n += length(split(line))
    end
    return n
end

The code above will count the number of words in the file quote.txt.
The readlines() reads the whole file and returns a vector whose kth element is the kth line of the file.
Thus,

open("quote.txt", "r") do io
    lines = readlines(io)
    print(lines[end])
end

prints the last line of the file.
"""

#Writing a text file...
#We can also create a new file, by using:
open("practice.txt","w") do io
    write(io, "This is the first line.\n")
    write(io, "This is the second line.\n")
end
#We can see a new practice.txt file appear in our directory.

#We can quickly save a matrix into a text file using writedlm() from the DelimitedFiles module:
using DelimitedFiles
A = [3 -2 5 7 
     0 4 4 9
     1 3 8 2]
writedlm("backup.txt", A)

"""
If Julia REPL is restarted, so A is undefined, then we use readdlm() to retrieve the matrix entries:

using DelimitedFiles
A = readdlm("backup.txt")
"""

#Saving and loading floating point data...
#The functions, writedlm() and readdlm() are simple and convenient for dealing with small matrices.
#but inefficient for large floating-point matrices because each matrix entry has to be converted from a Float64 to a character string when writing to a file
#and from a string to a Float64 when reading from a file.
#Also, the Float64 representation of π uses 8 bytes, the text representation of 3.141592653589793 uses 17 bytes.
#The FileIO package supports a wide range of standard data file types. A native Julia data file type is .jld2, which requires the JLD2 package.
#The @save macro provides an easy way to save Julia data to a .jld2 file:

using JLD2, DelimitedFiles
A = [exp((-i+2j)/10) * i^2 for i = 1:100, j = 1:500]
@save "big_matrix.jld2" A
writedlm("big_matrix.txt",A)
#Above code create a 392K binary file called big_matrix.jld2 and a 1022K text file called big_matrix.txt
#In a new Julia session, we can recover the matrix A using the @load macro:
using JLD2
@load "big_matrix.jld2" A
#Which assigns the name A to the opened matrix:
A
