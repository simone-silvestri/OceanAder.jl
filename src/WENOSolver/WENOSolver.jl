module WENOSolver

export WSolver, smoothness_matrix

using Oceananigans
using KernelAbstractions: @index, @kernel

include("smoothness_matrix.jl")
include("reconstruction_matrix.jl")

struct WSolver{K, M, R, S}
    Aˢ :: R
    Σ  :: S
end

function WSolver(; polynomial_degree = 3,
                   half_stencil_number = polynomial_degree ÷ 2)

    Σ  = smoothness_matrix(polynomial_degree)
    Aˢ = [] 

    for s in -half_stencil_number:half_stencil_number
        push!(Aˢ, inv(reconstruction_matrix(polynomial_degree, half_stencil_number, s)))
    end

    return WSolver{half_stencil_number, polynomial_degree, typeof(Aˢ), typeof(Σ)}(Aˢ, Σ)
end

function reconstruct(u, solver::WSolver{K, M}) where {K, M}
    w = zeros(size(u), M+1)

    for i in 1:length(u)
        for s in 
        end
    end
end


end