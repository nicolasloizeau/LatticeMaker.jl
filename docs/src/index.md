```@meta
CurrentModule = LatticeMaker
```

# LatticeMaker

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://nicolasloizeau.github.io/LatticeMaker.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/)
[![Build Status](https://github.com/nicolasloizeau/LatticeMaker.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nicolasloizeau/LatticeMaker.jl/actions/workflows/CI.yml?query=branch%3Amain)


This is a package for constructing lattices in Julia.

## Installation

```julia
using Pkg
Pkg.add(url="https://github.com/nicolasloizeau/LatticeMaker.jl")
```

## Usage

Standard lattices constructors are provided : [`SquareLattice`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/square/), [`CubicLattice`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/cubic/), [`TriangularLattice`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/triangular/), [`HexagonalLattice`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/hexagonal/) and [`KagomeLattice`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/kagome/). Custom lattices can be constructed using [`UnitCell`](https://nicolasloizeau.github.io/LatticeMaker.jl/dev/custom/).


Example: Construct a hexagonal lattice with 3*4 cells and periodic boundary conditions along the x-axis, and plot it:

```@example ex1
using CairoMakie # for plotting
using LatticeMaker
lattice = HexagonalLattice(4,5; periodic=(true, false))
plot_lattice(lattice)
```

```@example ex1
positions(lattice)
```

```@example ex1
edges(lattice)
```

```@index
```

```@autodocs
Modules = [LatticeMaker]
```
