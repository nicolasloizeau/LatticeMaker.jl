using CairoMakie
CairoMakie.set_theme!(screen = (; visible=false), px_per_unit=4)
using LatticeMaker
using Documenter


DocMeta.setdocmeta!(LatticeMaker, :DocTestSetup, :(using LatticeMaker); recursive=true)

makedocs(;
    modules=[LatticeMaker],
    authors="Nicolas Loizeau",
    sitename="LatticeMaker.jl",
    format=Documenter.HTML(;
        canonical="https://nicolasloizeau.github.io/LatticeMaker.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "SquareLattice" => "square.md",
        "CubicLattice" => "cubic.md",
        "TriangularLattice" => "triangular.md",
        "HexagonalLattice" => "hexagonal.md",
        "KagomeLattice" => "kagome.md",
        "Custom lattices" => "custom.md",
        "Advanced" => "advanced.md",
    ],
)

deploydocs(;
    repo="github.com/nicolasloizeau/LatticeMaker.jl",
    devbranch="main",
)
