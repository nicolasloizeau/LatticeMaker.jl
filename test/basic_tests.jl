

function basic_tests(lattice::Lattice, Ls::NTuple{N,Int}) where N
    @test size(lattice) == Ls
    @test length(sites(lattice)) == length(lattice)
    @test length(positions(lattice)) == length(lattice)
    @test length(Set(edges(lattice))) == length(edges(lattice))
    @test length(Set(positions(lattice))) == length(positions(lattice))
end
