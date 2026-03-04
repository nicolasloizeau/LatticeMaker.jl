
using GLMakie
using SimpleLattices


lattice = Lattice(SQUARE_CELL, (4,5), (false, false))


# const cell = UnitCell(
#     ((1.0,0.0,0.0), (0.0,1.0,0.0), (0.0,0.0,1.0)),
#     [(0.0,0.0,0.0), (0.2,0.2,0.2)],
#     [(1, (1,0,0), 1),
#      (1, (0,1,0), 1),
#      (1, (0,0,1), 1),
#      (1, (0,0,1), 2)]
# )
# const cell = UnitCell(
#     ((1.0,0.0), (0.0,1.0)),
#     [(0.0,0.0), (0.2, 0.2)],
#     [(1, (0,1), 1),
#      (1, (1,0), 1),
#      (1, (1,2), 1),
#      (1, (0, 0), 2)]
# )

# lattice = Lattice(cell, (2,3,4), (true, true,true))

println(positions(lattice))
println(site_indexes(lattice))
fig = plot_lattice(lattice)
println(edges(lattice))
println(length(edges(lattice)))

display(fig)
sleep(1000)

save("lattice.png", fig)
