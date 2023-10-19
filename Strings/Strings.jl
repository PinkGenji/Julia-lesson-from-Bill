#Aside from numbers, we also need to deal with strings in computing, such as labels and titles in plots.

#Strings and Characters...
#Unicode provides a standard for encoding character sets for use on a computer, Julia supports the most widely used encoding, UTF-8
#in which each character is represented by a valid "code point" consisting of one to four "code units", each "code unit" needs 8 bits = 1 byte.
#The first 2^7 = 128 code points provide the ASCII character set dating from 1960s.
#Julia characters have type Char, and are delimited with single quotes. We can see the UTF-8 code point for a character by using codepoint():
n = codepoint('G')
#Here, n is an unsigned 32-bit integer, or UInt32, and the eight digits following the 0x give the hexadecimal representation of n.
#Hence, n has the decimal value 4×16+7×1 = 71, which we can verify using Int64(n):
Int64(n)
#Conversely, we can use char():
Char(n)

#A string is just a sequence of characters. Julia strings have the type "string" and are delimited by double or triple quotes:
s1 = "Here is a simple string."
#Like latex, we need backslash \ as an escapte character:
s2 = "\"Stealing Mr. Zubov's oldest whisky,\" said Ossian."
print(s2)

#The new line character is '\n', it causes the next character to print on a new line:
print("Here is one line.\nHere is a second line")

#println() takes a string and appends a \n before printing. The different between it and print() is not appranet in REPL, but obvious when pring from a .jl file.
#We can prevent jumping to a new line by finishing a line with a backslash\:
print("Here is one line.\
This text appears on the same line")

#Triple quoted strings allow you to work with several lines of text at once. Hence:
s3 = """
container types in Julia include
*Vector,
*Matrix,
*Tuple,
*String."""
print(s3)

#Indexing for strings...
#Indexing works as you would expect for a string that contains only ASCII characters, since each character then only need one code unit:
s = "The website of Dreadful Night"
s[1]
#We can easily extract a substring:
s[5:11]
#Notice that s[16] returns the character 'D' but s[16:16] returns the string "D":
s[16]
s[16:16]
#Like a tuple, a string is immutable:
s[25] ="L"
#We must use replace() to make the change:
s = replace(s, 'N'=>'L')
#But length() works as expected:
length(s)
ncodeunits(s)

#Things become more complicated if we allow non-ASCII characters:
q = "∀ ϵ > 0 ∃ > 0"
length(q)
ncodeunits(q)
#Becasue some of the characters need more than one code unit:
q[1]
q[2] #becuase ∀ needs three code units.
i = eachindex(q) #This creates an interator i that returns every valid index:
v = [q[k] for k in i]
print(v) #This prints the vector of each character.
collect(i) #This shows valid indices in i. Which matches with length() function.

#Operations on strings...
#The multiplication operator * is used to concatnate strings:
s1 = "Flynne"
s2 = "Fisher"
s1*s2
#The ^ operator is used to repeat a string:
print("Cayce"^3)
#lowercase() and uppercase() convert all chaacters in a string to lower or upper case:
lowercase("Hello World!")
uppercase("Hello World!")
#findall() and findfirst() are used to find the index or range of indices of a character or substring in a string:
findall('i', s)
findfirst("web",s)

#Formatted output...
#we need the module Printf to have a fine control over how the value of a variable is formatted.
#We can use the macro @sprintf from the Prinf module:
using Printf
x = 4.561552812808831
y = 0.4384471871911697
s = @sprintf("The zeros are %.5f and %.5f.", x, y)
#The first argument to @sprintf is called the format string. The format specifier %.5f says to use a fixed point format with five digits after the decimal point.
#The arguments listed after the format string are matched in order, with the format specifiers.
#Another macro @printf works the same way as @sprintf, but prints directly instead of returning a string.

#We can also use the | character as a visible delimiter around each string:
#Doing
name = "Wilf"
age = 32
@printf("|%10s| => |%5d|\n", name, age)
#produces:
#|      Wilf| => |   32|
#Here, %10s says to print a string variable in a field of width 10, so "Wilf" is padded with 6 spaces. Similarly, %5d says to print an integer variable in a field of width 5 using decimal digits.
#For floating point variables, we can use fixed point format f or expoential format e, that allow us to specify both the field width and the number of digits following the decimal point:
@printf("|%10.4f|",π)
@printf("|%12.4e|\n", exp(10))

#Docstrings...
#A docstring describes the purpose of, and key information about, a function.
#An example is the green docstrings in our solve_quadratic function from the topic of "Functions".
