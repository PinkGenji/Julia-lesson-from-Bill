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
markercolor = :green, title = "The graph of scatter")

#The Plots documentation uses the term series to describe a set of (x,y) data values. We can use
#the plot!() function to add an additional series to an existing plot:
x = range(0,π, length=201);
y1 = sin.(3x);
plot(x,y1, title = "Multiple series")
y2 = cos.(2x.-π);
plot!(x,y2)
y3 = 0.5*sin.(2x.+π/4);
plot!(x,y3)

#To save a copy of a plot as .png or .pdf, we can use:
#savefig("myplot.png") or savefig("myplot.pdf")

#Subplots...
#It is also possible to display several subplots, see the file "my_subplots.jl"

#Axis tweaks...
#We can also adjust the location and labels of the tick marks on an axis using the 'xticks' and 'yticks' keyword:
x = range(0, 2π, length = 201);
y = sin.(x);
plot(x,y, legend = false, xticks = ([0, π/2, π, 3π/2, 2π], ["0", "π/2", "π", "3π/2", "2π"]))
#We can also manually adjust the axis limits using 'xlims, ylims':
plot(x,y, legend = false, xticks = ([0, π/2, π, 3π/2, 2π], ["0", "π/2", "π", "3π/2", "2π"]), ylims=(0, 1))

#Polar plots...

