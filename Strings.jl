#Aside from numbers, we also need to deal with strings in computing, such as labels and titles in plots.

#Strings and Characters...
#Unicode provides a standard for encoding character sets for use on a computer, Julia supports the most widely used encoding, UTF-8
#in which each character is represented by a valid "code point" consisting of one to four "code units", each "code unit" needs 8 bits = 1 byte.
#The first 2^7 = 128 code points provide the ASCII character set dating from 1960s.
#Julia characters have type Char, and are delimited with single quotes. We can see the UTF-8 code point for a character by using codepoint():
n = codepoint('G')

