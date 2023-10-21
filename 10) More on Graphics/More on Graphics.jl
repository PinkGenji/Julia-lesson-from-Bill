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
"""
A contour or level set of a real-valued function f(x,y) is a curve of the form:
f(x,y) = c for some constant c.
A standard way of visualising f is to plot the family of countours determined by a sequence of values for c.
"""
#If f(x,y) = x^3-3x+y^2 then we can create a contour plot of f as follows:
f(x,y) = x^3 -3x +y^2
x = range(-3,3,length=250);
y = range(-4, 4, length=200);
z = f.(x',y);
contour(x,y,z,xlabel = L"x", ylabel = L"y", levels=20)
#We can produce a filled contour plot by using contourf():
contourf(x,y,z,xlabel = L"x", ylabel = L"y", levels = 20)

#Surface plots...
#Another way to visualise a real-valued function f(x,y) is to plot the graph, z=f(x,y), in xyz-space.
#We can produce a such graph via:
surface(x,y,z,xlabel=L"x",ylabel=L"y", zlabel = L"z", view_angle=(135,10))
#The view_angle() attribute manages the elevation angle above the xy-plane, the default is (30,30)

#Quiver plots...
#A quiver plot is used to visualise a 2D vector field, that is, a vector valued function:
x = range(-1,1,length=15);
y = range(-π,π,length=15);
X = [x[j] for i = 1:15, j = 1:15];
Y = [y[i] for i = 1:15, j = 1:15];
U = sin.(Y);
V = -X;
scale=0.1;
sU = scale * U;
sV = scale * V;
quiver(X,Y,quiver = (sU, sV))
#At each point (X[i,j], Y[i,j]), an arrow is drawn from this point to (X[i.j] + sU[i,j], Y[i,j]+sV[i,j])

#Alternative Graphics Backends...
#The Plots package relied on a software called backend to create its graphical output. The default backend is called GR and is the one most likely to work reliably out of box.
#Usually the output looks pretty much the same for any choice of backend, but sometimes a particular backend might offer extra features.
#For example, the Plotly backend supports mouse interaction to change the viewing angle in a 3D plot.
#If we install the Plotly, and do:
using Plots
plotly()
#Using the surface plot we used above, we can use mouse to interact the view angle:
surface(x,y,z,xlabel=L"x",ylabel=L"y", zlabel = L"z")
