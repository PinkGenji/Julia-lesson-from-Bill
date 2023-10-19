#This is the function file to solve quadratic functions.

"""
    solve_quadratic(a,b,c)
solve the quadratic equation "ax^2 + bx + c = 0".
Warning: the coefficient 'a', 'b', 'c' must be real, and the discriminant must be positive, so that two real roots are returned.
"""

function solve_quadratic(a,b,c)
    sqrt_dscr = sqrt(b^2-4a*c)
    x_plus = (-b+sqrt_dscr)/(2a)
    x_minus = (-b-sqrt_dscr)/(2a)
    return x_plus, x_minus
end
#We say that 'sqrt_dscr, x_plus, x_minus' are local variables in the scoping unit of the function 'solve-quadratic'.
#The local variables cannot be referenced outside their smallest enclosing scoping unit.
