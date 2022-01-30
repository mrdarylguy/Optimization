using JuMP, Cbc, Plots
plotly()
Plots.PlotlyBackend()

L=Model(Cbc.Optimizer)

#variables
@variable(L, 0 <= S[1:15])
@variable(L, 0 <= B[1:2])


#objective function
@objective(L,
           Min, 
           0.98B[1]+0.965B[2]+S[1]+10)

#declare constraints
@constraint(L, constraint1, 0.06B[1] +0.065B[2] + 1.04S[1] - S[2] == 11)
@constraint(L, constraint2, 0.06B[1] +0.065B[2] + 1.04S[2] - S[2] == 12)
@constraint(L, constraint3, 0.06B[1] +0.065B[2] + 1.04S[3] - S[3] == 14)
@constraint(L, constraint4, 0.06B[1] +0.065B[2] + 1.04S[4] - S[4] == 15)
@constraint(L, constraint5, 1.06B[1] +0.065B[2] + 1.04S[5] - S[5] ==17)
@constraint(L, constraint6, 0.065B[2] + 1.04S[5] - S[6] == 19)
@constraint(L, constraint7, 0.065B[2] + 1.04S[6] - S[7] == 20)
@constraint(L, constraint8, 0.065B[2] + 1.04S[7] - S[8] == 22)
@constraint(L, constraint9, 0.065B[2] + 1.04S[8] - S[9] == 24)
@constraint(L, constraint10, 0.065B[2] + 1.04S[9] - S[10] == 26)
@constraint(L, constraint11, 0.065B[2] + 1.04S[10] - S[11] == 29)
@constraint(L, constraint12, 1.065B[2] + 1.04S[11] - S[12] == 31)
@constraint(L, constraint13, 1.04S[12] - S[13]==33)
@constraint(L, constraint14, 1.04S[13] - S[14]==36)


optimize!(L)
println(round(objective_value(L), digits=5));