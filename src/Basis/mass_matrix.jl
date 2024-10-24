# The Mass matrix is defined as 
# <Φ_l, Φ_m> = ∫Ω Φ_l Φ_m dx

# 1D Mass matrix (space-time)
@inline function mass_matrix(::Val{1}, M)
    L = (M + 1)^2
    ℳ = zeros(L, L)

    for k in 1:L
        for l in 1:L
            i₁ = index_i(Val(1), k, M)
            t₁ = index_t(Val(1), k, M)
            i₂ = index_i(Val(1), l, M)
            t₂ = index_t(Val(1), l, M)
            ℳ[k, l] = (∫ΨΨ(i₁,  i₂)(1) - ∫ΨΨ(i₁, i₂)(0)) * (∫ΨΨ(t₁, t₂)(1) - ∫ΨΨ(t₁, t₂)(0))
        end
    end

    return ℳ
end

