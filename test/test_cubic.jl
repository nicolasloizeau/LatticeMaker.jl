
using SimpleLattices
using Test
include("basic_tests.jl")

@testset "CubicLattice" begin
    Nx = 2
    Ny = 3
    Nz = 4
    lattice = CubicLattice(Nx, Ny, Nz)
    basic_tests(lattice, (Nx, Ny, Nz))
    @test length(edges(lattice)) == (Nx-1)*Ny*Nz + Nx*(Ny-1)*Nz + Nx*Ny*(Nz-1)
    e1 = Set(edges(lattice))
    e2 = Set([[1, 13], [1, 5], [1, 2], [2, 14], [2, 6], [2, 3], [3, 15], [3, 7], [3, 4], [4, 16], [4, 8], [5, 17], [5, 9], [5, 6], [6, 18], [6, 10], [6, 7], [7, 19], [7, 11], [7, 8], [8, 20], [8, 12], [9, 21], [9, 10], [10, 22], [10, 11], [11, 23], [11, 12], [12, 24], [13, 17], [13, 14], [14, 18], [14, 15], [15, 19], [15, 16], [16, 20], [17, 21], [17, 18], [18, 22], [18, 19], [19, 23], [19, 20], [20, 24], [21, 22], [22, 23], [23, 24]])
    @test e1 == e2
end
