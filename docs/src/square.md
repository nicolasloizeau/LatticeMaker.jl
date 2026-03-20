
# Square Lattice

Build a square lattice with periodic boundary conditions in both directions:
```@example ex1
using CairoMakie
using LatticeMaker
L = SquareLattice(7, 5; periodic = (true, true))
```

Get the edges of the lattice:
```@example ex1
edges(L)
```

Plot the lattice:
```@example ex1
plot_lattice(L)
```
