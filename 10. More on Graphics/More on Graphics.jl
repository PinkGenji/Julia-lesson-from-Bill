#The plot function suffices for graphing simple curves of the form y = f(x).
#But for more complex plots involving functions of several variables or vector-valued functions, the plots package provides more functions.

#First we load the modules:
using Plots, LaTeXStrings
#The basic plot() command can be used to plot a parametric curve:
t = range(-1,1,length=301);
x = 3*cospi.(t);
y = sinpi.(t);
plot(x, y, xlabel = "x", ylabel ="y", label = "ellipse", aspect_ratio = :equal)
#By setting aspect_ratio=:equal, we ensure that the scale on the x-axis is the same as the scale on the y-axis.

#If the y-values of a plot vary over several orders of magnitude, then a log scale on the y-axis will often allo the behaviour of the curve to be seen better.
#For example: (Notice the L"..." syntax for a LaTeX string)
x = range(0,200, length =301);
y1 = 1 ./ (1 .+ x).^2;
y2 = 1 ./ (1 .+ x).^4;
p1 = plot(x,[y1 y2], label = [L"(1+x)^{-2}" L"(1+x)^{-4}"]);
p2 = plot(x,[y1 y2], yscale=:log10, xlabel=L"x", label = [L"(1+x)^{-2}" L"(1+x)^{-4}"]);
plot(p1, p2, layout=(2,1))
#In addition, we can also set xscale=:log10 to use a log scale on the x-axis.

#Contour plots...


