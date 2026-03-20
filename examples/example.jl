using CairoMakie
using LatticeMaker


lattice = HexagonalLattice(4,5; periodic=(true, false))

println(positions(lattice))
println(edges(lattice))

fig = plot_lattice(lattice)
display(fig)
sleep(1000)
