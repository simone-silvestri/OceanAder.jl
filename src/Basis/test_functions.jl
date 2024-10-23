
# unroll the mono-index in the different Basis functions
# assuming that all spatio-temporal directions are 
# discretized with the same number of basis functions M,
# therefore mono-index  is defined as follows:
# l = i + 1 + j * L + l * L^2 + t * L^3 for 0 ≤ i, j, k, t ≤ L - 1 = M
# The index l spans the range [1, L^d] where d is the number of spatial dimensions + time
for M in 1:5
    L = M+1
    # 1D computations
    for l in 1:L^2
        @eval @inline index_i(::Val{1}, ::Val{$l}, ::Val{$M}) = Val((mod($l-1, $L)))
        @eval @inline index_t(::Val{1}, ::Val{$l}, ::Val{$M}) = Val((div($l-1, $L)))
    end
    # # 2D computations
    # for l in 1:L^3
    #     @eval @inline index_i(::Val{2}, ::Val{$l}, ::Val{$M}) = Val(mod($l-1, $L))
    #     @eval @inline index_j(::Val{2}, ::Val{$l}, ::Val{$M}) = Val(div(mod($l-1, $L^2), $L))
    #     @eval @inline index_t(::Val{2}, ::Val{$l}, ::Val{$M}) = Val(div($l-1, $L^2))
    # end
    # # 3D computations
    # for l in 1:L^4
    #     @eval @inline index_i(::Val{3}, ::Val{$l}, ::Val{$M}) = Val(mod($l, $M) - 1)
    #     @eval @inline index_j(::Val{3}, ::Val{$l}, ::Val{$M}) = Val(div(mod($l, $L^2), $L))
    #     @eval @inline index_k(::Val{3}, ::Val{$l}, ::Val{$M}) = Val(div(mod($l, $L^3), $L^2))
    #     @eval @inline index_t(::Val{3}, ::Val{$l}, ::Val{$M}) = Val(div($l, $L^2))
    # end
end

# Utilities
@inline index_i(dim, l::Int, M::Int) = index_i(dim, Val(l), Val(M))
@inline index_j(dim, l::Int, M::Int) = index_j(dim, Val(l), Val(M))
@inline index_k(dim, l::Int, M::Int) = index_k(dim, Val(l), Val(M))
@inline index_t(dim, l::Int, M::Int) = index_t(dim, Val(l), Val(M))

# 1D test functions
@inline function Φ(l, M, ξ, τ)
    i = index_i(Val(1), l, M)
    t = index_t(Val(1), l, M)
    return Ψ(i, ξ) * Ψ(t, τ)
end

# # 2D test functions
# @inline function Φ(l, M, ξ, η, τ)
#     i = index_i(Val(2), l, M)
#     j = index_j(Val(2), l, M)
#     t = index_t(Val(2), l, M)
#     return Ψ(i, ξ) * Ψ(j, η) * Ψ(t, τ)
# end

# # 3D test functions
# function Φ(l, M, ξ, η, ζ, τ)
#     i = index_i(Val(3), l, M)
#     j = index_j(Val(3), l, M)
#     k = index_k(Val(3), l, M)
#     t = index_t(Val(3), l, M)
#     return Ψ(i, ξ) * Ψ(j, η) * Ψ(k, ζ) * Ψ(t, τ)
# end
