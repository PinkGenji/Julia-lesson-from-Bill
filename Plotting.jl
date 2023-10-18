#Make sure 'Plots' is installed.
#Start with a simple plotting:
using Plots
x = range(0,2π, length = 201) #range() crates an AbstractVector object.
y = sin.(x)
plot(x,y)

#We can modify the plot style:
plot(x,y, linestyle=:dash)
plot(x,y, linestyle=:dashdotdot)
#The plotattr() is useful for looking up plot attributes:
plotattr("linestyle")
#We can use ls, s or style for linestyle:
plot(x,y, ls=:dash)
plot(x,y, linecolor= :red)

#We can also plot discrete data using a variety of different marker symbols using the scatter function:
x = range(1,5, length=9)
y = exp.(-x/2) +2*sin.(40x);
scatter(x,y, markershape = :circle,
markercolor = :green)


