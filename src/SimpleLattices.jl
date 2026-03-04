module SimpleLattices

abstract type AbstractLattice end
abstract type AbstractLattice2D <: AbstractLattice end
abstract type AbstractLattice3D <: AbstractLattice end


include("lattices.jl")
include("generator.jl")


"""
    plot_lattice(lattice::AbstractLattice)

Plot the given lattice. Using GLMakie or CairoMakie if available. Returns a figure.
"""
function plot_lattice(lattice::AbstractLattice)
    println("No plotting backend available. Please use GLMakie or CairoMakie to enable plotting.")
    println("Plotting not implemented for lattice type: ", typeof(lattice))
end

"""
    plot_positions(lattice::AbstractLattice)
Plot the positions of the sites in the given lattice. Using GLMakie or CairoMakie if available. Returns a figure.
"""
function plot_positions(lattice::AbstractLattice)
    println("No plotting backend available. Please use GLMakie or CairoMakie to enable plotting.")
    println("Plotting not implemented for lattice type: ", typeof(lattice))
end





export AbstractLattice, AbstractLattice2D, AbstractLattice3D
export edges, sites, positions, periodic_boundary_edges
export plot_lattice
export plot_positions

export SquareLattice
export CubicLattice
export TriangularLattice
export HexagonalLattice

export SQUARE_CELL, CUBIC_CELL, TRIANGULAR_CELL, HEXAGONAL_CELL, KAGOME_CELL
export Lattice, UnitCell
export site_indexes, site_index
end
