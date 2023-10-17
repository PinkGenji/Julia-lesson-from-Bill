#Function writing in Julia are somewhat more intuitive than MATLAB:
f(x) = sin(4x) - log(x)
f(0.5)
f(1)
#We can find the root of this function by using Roots (need to install it via REPL):
using Roots
z = find_zero(f,[0.5, 1.0]) #The second argument is about specifing the bracketing of the roots.
f(z) #To confirm, it is indeed close to machine epsilon.
#Julia allows any number of arguments and any number of return variables:
g(x,y) = (2x-y, x^2 +cos(x*y))
g(1,3) 
t = g(2,3) #returns the tuple and assign it to t
a,b = g(1,3) #Now, a and b are assigned to the two enries in tuple
#The dummy arguments of a function are the names used in the definition of a function.
#The actual arguments are the values supplied when we call a function.
#When the function is called, the kth actual argument gets assigned to the kth dummy argument,
#then the code that defines the function is executed and results are returned.

#Sometimes, optional argument allows us to have more information.
z = find_zero(f,(0.5,1.0),verbose=true)
z = find_zero(f,(0.5,1.0), Order2(); verbose = true)
#It's also possible to set a default value for a dummy argument.
#A default value is used when the corresponding actual argument is omitted from a function call:
normal_distribution(x,μ=0.0,σ=1.0) = exp(-((x-μ)/σ)^2/2) / (σ*sqrt(2π))
normal_distribution(0.5) #This returns the normal density at x=0.5 with mean = 0, sd = 1
normal_distribution(0.5,3.0,0.5) #This returns the normal density at x=0.5, with mean=3, sd=0.5

