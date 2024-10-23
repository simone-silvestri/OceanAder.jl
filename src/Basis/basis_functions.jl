# Scaled Lagrange polynomials forming the basis functions 
# in the [0, 1] interval for the ADER-WENO method
# see e.g. Dumbser et al. (2014) for details
@inline Ψ(::Val{0}, ξ) = 1
@inline Ψ(::Val{1}, ξ) = 2ξ - 1
@inline Ψ(::Val{2}, ξ) = 6ξ^2 - 6ξ + 1
@inline Ψ(::Val{3}, ξ) = 20ξ^3 - 30ξ^2 + 12ξ - 1
@inline Ψ(::Val{4}, ξ) = 70ξ^4 - 140ξ^3 + 90ξ^2 - 20ξ + 1
@inline Ψ(::Val{5}, ξ) = 252ξ^5 - 630ξ^4 + 560ξ^3 - 210ξ^2 + 30ξ - 1

@inline ∂Ψ(::Val{0}, ξ) = 0
@inline ∂Ψ(::Val{1}, ξ) = 2
@inline ∂Ψ(::Val{2}, ξ) = 12ξ - 6
@inline ∂Ψ(::Val{3}, ξ) = 60ξ^2 - 60ξ + 12
@inline ∂Ψ(::Val{4}, ξ) = 280ξ^3 - 420ξ^2 + 180ξ - 20
@inline ∂Ψ(::Val{5}, ξ) = 1260ξ^4 - 2520ξ^3 + 1680ξ^2 - 420ξ + 30