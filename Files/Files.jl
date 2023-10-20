
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
    word_list = split(line)
    if length(word_list) == 0
        println()
    else
        println(word_list[1])
    end
end

