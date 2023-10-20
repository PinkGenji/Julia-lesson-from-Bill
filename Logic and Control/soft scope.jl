#Consider the following for-loop and function:

s = 0.0
for k = 1:10
    global s += 1/k^2
end
println("The sum equals ", s)

s=0.0
function add_it_up(n)
    for k = 1:n
        global s += 1/k^2
    end
end
add_it_up(10)
println("The sum equals ",s)

#If we remove the "global" in the body of the for-loop, Julia will not complain.
#But removing the "global" in the function body, Julia will give an UndefVarError.
#This is because the for-loop has a soft scope while a function has a hard scope.
#We no longer need the global declaration if we re-write the function by making s a local variable:
function add_it_up(n)
    s = 0.0
    for k = 1:n
        s += 1/k^2
    end
    return s
end
println("The sum equals ", add_it_up(10))
