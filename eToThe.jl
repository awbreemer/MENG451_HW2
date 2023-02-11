using Pkg
Pkg.activate(".")

using SymPy
using LinearAlgebra


@vars s t 

A = [-4 1 4;
    2 -5 2;
    -3 3 -3]

part = I * s

useMatrix = part - A
f = inv(useMatrix)

 
answer = sympy.inverse_laplace_transform(f,s,t)

eigenComps = eigen(A)

eigVecs = eigenComps.vectors

eigVals = eigenComps.values

#mainMatrix = [sympy.exp(t*eigVals[1]) 0 0; 0 sympy.exp(t*eigVals[2]) 0; 0 0 sympy.exp(t*eigVals[3])]
diag_matrix = diagm(0 => exp.(λ*t))

answerP2 = eigVecs*mainMatrix*inv(eigVecs)

print(answer)
print(answerP2)