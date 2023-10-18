using Plots
x = range(0, 2π, length=201)
y = sin.(x)
plot(x,y,
    xlabel = 'x', ylabel = 'y',
    title = "The Graph of y=sin(x)",
    legend=false)
