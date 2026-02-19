
# Triangular Lattice

Build a cubit lattice:
```@example cubic
using CairoMakie
using SimpleLattices
L = TriangularLattice(7, 5, true, true)
```

Get the edges of the lattice:
```@example cubic
edges(L)
```

Plot the lattice:
```@example cubic
plot_lattice(L)
```
