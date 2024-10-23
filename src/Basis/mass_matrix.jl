# The Mass matrix is defined as 
# <Φ_l, Φ_m> = ∫Ω Φ_l Φ_m dx

# 1D Mass matrix (space-time)
@inline function mass_matrix(::Val{1}, M)
    L = (M + 1)^2
    ℳ = zeros(L, L)

    for l in 1:L
        i = index_i(Val(1), k, M)
        t = index_t(Val(1), k, M)
        ℳ[k, l] = ∫Ψ(i) * ∫Ψ(j) * ∫Ψ(t) * ∫Ψ(s)
    end
    
    return ℳ
end