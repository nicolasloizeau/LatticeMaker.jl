
using GLMakie
using SimpleLattices


L = TriangularLattice(5, 7, false, true)

println(typeof(L)<:AbstractLattice2D)

println(edges(L))


fig = plot_lattice(L)
display(fig)
sleep(10^9)
