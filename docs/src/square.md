
# Square Lattice

Build a cubit lattice:
```@example cubic
using GLMakie
using SimpleLattices
L = SquareLattice(7, 5, true, true)
```

Get the edges of the lattice:
```@example cubic
edges(L)
```

Plot the lattice:
```@example cubic
plot_lattice(L)
```
