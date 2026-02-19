module SimpleLattices

abstract type AbstractLattice end
abstract type AbstractLattice2D <: AbstractLattice end
abstract type AbstractLattice3D <: AbstractLattice end


include("square.jl")
include("cubic.jl")
function plot_lattice(lattice::AbstractLattice)
    println("Plotting not implemented for lattice type: ", typeof(lattice))
end

export AbstractLattice, AbstractLattice2D, AbstractLattice3D
export SquareLattice
export CubicLattice
export edges, sites, positions
export plot_lattice



end
