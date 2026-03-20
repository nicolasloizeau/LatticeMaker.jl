
# Advanced usage

## Getting a subset of edges

`edges` can take an optional keyword argument `edge_indexes` to specify which kind of edges to return. Here is an example with a cubic lattice, but this works for any lattice.



```@example ex1
using CairoMakie
using LatticeMaker
L = CubicLattice(2, 3, 4)
```


```@example ex1
edges1 = edges(L; edge_indexes=[1])
plot_lattice(sites(L), positions(L), edges1)
```

```@example ex1
edges2 = edges(L; edge_indexes=[2])
plot_lattice(sites(L), positions(L), edges2)
```

```@example ex1
edges2 = edges(L; edge_indexes=[3])
plot_lattice(sites(L), positions(L), edges2)
```


`edge_indexes` indexes the edge specified in the `UnitCell` of the lattice. For example, for the cubic lattice, the `UnitCell` is:

```julia
const CUBIC_CELL = UnitCell(
    ((1.0,0.0,0.0), (0.0,1.0,0.0), (0.0,0.0,1.0)),
    [(0.0,0.0,0.0)],
    [(1, (1,0,0), 1), #edges 1 (along x)
     (1, (0,1,0), 1), #edges 2 (along y)
     (1, (0,0,1), 1)] #edges 3 (along z)
)
```
See [`Custom lattices`](custom.md) for more details on how to specify the `UnitCell` of a lattice.


## Getting a subset of sites

Some `UnitCell` may contain more than one site. For example, the `UnitCell` of the hexagonal lattice is:

```julia 
const HEXAGONAL_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),
    [(0.0,0.0),
     (0.5, sqrt(3)/6)],
    [
     (1, (0,0), 2),
     (1, (-1,0), 2),
     (1, (0,-1), 2),
    ]
)
```

In order to only get a subset of sites, you can use the `site_indexes` keyword argument of `sites`:

```@example ex1
L = HexagonalLattice(4, 5)
sites(L; site_indexes=[1])
```

```@example ex1
sites(L; site_indexes=[2])
```
