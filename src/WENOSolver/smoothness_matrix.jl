using OceanADER.Basis
using Polynomials

function smoothness_matrix(M)
    Σ = zeros(M+1, M+1)

    for l in 0:M
        for m in 0:M
            for α in map(Val, 1:M)
                lv = Val(l)
                mv = Val(m)
                p  = integrate(∂Ψ(lv, α) * ∂Ψ(mv, α))
                Σ[l+1, m+1] += (p(1) - p(0))
            end
        end
    end

    return Σ
end

function smoothness_indicator(w)
    M = length(w) - 1
    Σ = smoothness_matrix(M)
    return w' * Σ * w
end