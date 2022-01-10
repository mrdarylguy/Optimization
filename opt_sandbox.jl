using JuMP, Cbc, Plots
plotly()
Plots.PlotlyBackend()

m=Model(Cbc.Optimizer)

#variables
@variable(m, h>=0)
@variable(m, c>=0)
@variable(m, f>=0)
@variable(m, d>=0)

#objective function
@objective(m, Min, 250*h + 400*c + 370*f + 490*d)

#declare constraint
@constraint(m, constraint1, 4*h + 8*c + 2*f + 15*d >= 10)
@constraint(m, constraint2, 4*h + 15*c + 0*f + 6*d >= 10)
@constraint(m, constraint3, 10*h + 15*c + 15*f + 30*d >= 15)
@constraint(m, constraint4, 15*h + 8*c + 10*f + 20*d >= 15)

optimize!(m)

println("optimal value of h: ", getvalue(h))
println("optimal value of c: ", getvalue(c))
println("optimal value of f: ", getvalue(f))
println("optimal value of d: ", getvalue(d))