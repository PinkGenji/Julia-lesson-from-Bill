#In Julia, we can use latex symbols and the usual <= symbol for logic operation:
2 ≤ 3
2 <= 3
4 == 4
#There are two ways to write unequal:
4 != 5
4 ≠ 5
#Same as in the other lots of languages, we use && for Boolean "and", || for Boolean "or", ! for Boolean "not".
#Both && and || are short-circuit operators: the right operand is never evaluated if the truth value can be determined from only the left operad:
(7<5) && !(6>2) #We can tell from the left hand side that it's going to be false, so right hand side won't be evaluated.

#If-Construct...
"""
In Julia, the basic if-Construct form is:

if <condition>
    <statement>
end

Where <condition> can be any logical expression, and <statement> can be any sequence of statements.
If <condition> evaluates to true, then Julia will execute the <statement>.

A longer form of the construct is:
if <condition1>
    <statement1>
elseif <condition2>
    <statement2>
else
    <statement3>
end

In this case, <statement1> is executed iff <condition 1> is true; <statement2> is executed iff <condition1> is false and <condition2> is true; <statement3> is executed iff both <condition1> and <condition2> are false.
"""

#Consider the following example:
x = 6
if x>0
    y = log(x)
else
    y=NaN
end
#A more succinct, alternative is:
y = (x>0) ? log(x) : NaN
#The value of the expression "a ? b : c" equals b if a is true, otherwise the it equals c
#A re-write of the solve_quadratic(a,b,c) is possible, with using the if-construct. 
#Note: the precision of floating numbers must be considered.

#We can also further improve our function by throw argument error, for example:
function solve_quadratic_checker(a::Real, b::Real, c::Real)
    if a== 0
        throw(ArgumentError(
            "The Coefficient of x^2 must be non-zero"))
    end
end
#Note: we also used type assertion to each argument: if any of a,b or c is not a subtype of Real, then Julia will throw a MethodError.
#In addition, a==0 evaluates to true when a is zero regardless wheter a is an integer or a floating-point type.

#For-loop...
"""
In Julia, a for-loop has the form:

for k in <interator>
    <statement>
end

Where <iterator> is an interable container.
"""
#Example:
for k in [1,3,5]
    print(k,",")
end

for k = 1:2:9
    print(k,",")
end

#A for-loop is a scoping unit, but an if-statement is not:
for i = 1:5
    nu = i
end
println("nu= ",nu) #Since nu is solely local to the for-loop, the loop counter i is also a local variable, its value cannot be accessed outside the loop.
#But in a if-statement:
if true
    nu = 3
end
print("nu= ", nu)

#Lastly, for the concept of soft scope and hard scope, see the file soft_scope.jl
