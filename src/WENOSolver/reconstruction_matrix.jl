# S is an odd number! assuming constant grid spacing
function reconstruction_matrix(M, k, s)
    A = zeros(M+1, k * 2 + 1)

    for l in 0:M
        for j in s - k : s + k
            ξ₁ = j - 1
            ξ₂ = j 
            lv = Val(l)
            p  = integrate(Ψ(lv))
            A[l+1, j - (s - k) + 1] = p(ξ₂) - p(ξ₁)
        end
    end

    return A
end