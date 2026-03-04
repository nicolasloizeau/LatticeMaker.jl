
using CairoMakie
using SimpleLattices


lattice = Lattice(SQUARE_CELL, (6,5), (true, true))

println(positions(lattice))
println(site_indexes(lattice))
fig = plot_lattice(lattice)
println(edges(lattice))
println(length(edges(lattice)))

save("lattice.png", fig)
