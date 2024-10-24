using Polynomials

# Scaled Lagrange polynomials forming the basis functions 
# in the [0, 1] interval for the ADER-WENO method
# see e.g. Dumbser et al. (2014) for details
@inline Ψ(::Val{0}) = Polynomial(1)
@inline Ψ(::Val{1}) = Polynomial([-1, 2])
@inline Ψ(::Val{2}) = Polynomial([1, -6, 6])
@inline Ψ(::Val{3}) = Polynomial([-1, 12, -30, 20])
@inline Ψ(::Val{4}) = Polynomial([1, -20, 90, -140, 70])
@inline Ψ(::Val{5}) = Polynomial([-1, 30, -210, 560, -630, 252])

####
#### Derivatives
####

@inline ∂Ψ(::Val{l}, ::Val{N}) where {l, N} = derivative(∂Ψ(Val(l), Val(N-1)))

# Special derivatives
@inline ∂Ψ(::Val{l}, ::Val{1}) where l = derivative(Ψ(Val(l)))
@inline ∂Ψ(::Val{l}, ::Val{0}) where l = Ψ(Val(l))

####
#### Integrals
####

@inline ∫Ψ(i) = integrate(Ψ(i))
@inline ∫ΨΨ(i, j) = integrate(Ψ(i) * Ψ(j))
