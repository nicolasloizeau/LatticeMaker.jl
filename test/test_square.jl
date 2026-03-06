
using SimpleLattices
using Test
include("basic_tests.jl")

@testset "SquareLattice" begin
    Nx = 5
    Ny = 4
    lattice = SquareLattice(Nx, Ny)
    basic_tests(lattice, (Nx, Ny))
    @test length(edges(lattice)) == (Nx-1)*Ny + Nx*(Ny-1)
    e1 = Set(edges(lattice))
    e2 = Set([[1, 2], [1, 5], [2, 3], [2, 6], [3, 4], [3, 7], [4, 8], [5, 6], [5, 9], [6, 7], [6, 10], [7, 8], [7, 11], [8, 12], [9, 10], [9, 13], [10, 11], [10, 14], [11, 12], [11, 15], [12, 16], [13, 14], [13, 17], [14, 15], [14, 18], [15, 16], [15, 19], [16, 20], [17, 18], [18, 19], [19, 20]])
    @test e1 == e2
    lattice = SquareLattice(Nx, Ny; periodic=(true, true))
    basic_tests(lattice, (Nx, Ny))
    @test length(edges(lattice)) == Nx*Ny*2
    e1 = Set(edges(lattice))
    e2 = Set([[1, 2], [1, 5], [2, 3], [2, 6], [3, 4], [3, 7], [1, 4], [4, 8], [5, 6], [5, 9], [6, 7], [6, 10], [7, 8], [7, 11], [5, 8], [8, 12], [9, 10], [9, 13], [10, 11], [10, 14], [11, 12], [11, 15], [9, 12], [12, 16], [13, 14], [13, 17], [14, 15], [14, 18], [15, 16], [15, 19], [13, 16], [16, 20], [17, 18], [1, 17], [18, 19], [2, 18], [19, 20], [3, 19], [17, 20], [4, 20]])
    @test e1 == e2
end
