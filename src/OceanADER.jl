module OceanADER

export Ψ, Φ, ∫Ψ
export index_i, index_j, index_k, index_t

using Oceananigans
using Oceananigans: tupleit
using Oceananigans.Grids
using Oceananigans.Architectures: architecture
using Oceananigans.Advection: div_Uc
using Oceananigans.BoundaryConditions
using Oceananigans.Utils
using Oceananigans.Fields: TracerFields
using Oceananigans.Models.HydrostaticFreeSurfaceModels: PrescribedVelocityFields, tracernames, validate_tracer_advection, with_tracers, tracernames
using KernelAbstractions: @index, @kernel

import Oceananigans.Models: prognostic_fields

using Oceananigans.TimeSteppers: RungeKutta3TimeStepper, store_tendencies!, rk3_substep_field!
import Oceananigans.TimeSteppers: update_state!, time_step!, compute_tendencies!, rk3_substep!

include("Basis/Basis.jl")
include("advective_model.jl")

using .Basis

end
