#Make sure 'Plots' is installed.
#Start with a simple plotting:
using Plots
x = range(0,2π, length = 201); y = sin.(x);
plot(x,y)
