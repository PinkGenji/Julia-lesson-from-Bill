#This is the function file to solve quadratic functions.
function solve_quadratic(a,b,c)
    sqrt_dscr = sqrt(b^2-4a*c)
    x_plus = (-b+sqrt_dscr)/(2a)
    x_minus = (-b-sqrt_dscr)/(2a)
    return x_plus, x_minus
end
#We say that 'sqrt_dscr, x_plus, x_minus' are local variables in the scoping unit of the function 'solve-quadratic'.
#The local variables cannot be referenced outside their smallest enclosing scoping unit.

#We do not need to define all values as local variables. We can leave the dummy variable as it is, when we do not know the valueL:
h3(x) = 2x-b #here, b is a dummy variable that need to be defined in the 'global' scope.

#When there is no return written, Julia just returns the value of the final line of its body:
function h1(x)
    a = 3
    x^2+a
end 

#Anonymous Functions...


