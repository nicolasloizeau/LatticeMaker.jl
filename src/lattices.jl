struct UnitCell{D}
    vectors::NTuple{D, NTuple{D, Float64}}
    sites::Vector{NTuple{D, Float64}}
    edges::Vector{Tuple{Int, NTuple{D, Int}, Int}}
end


struct Lattice{D}
    cell::UnitCell{D}
    size::NTuple{D, Int}
    periodicity::NTuple{D, Bool}
end


const SQUARE_CELL = UnitCell(
    ((1.0,0.0), (0.0,1.0)),
    [(0.0,0.0)],
    [(1, (0,1), 1),
     (1, (1,0), 1),
     (1, (1,1), 1)]
)

const CUBIC_CELL = UnitCell(
    ((1.0,0.0,0.0), (0.0,1.0,0.0), (0.0,0.0,1.0)),
    [(0.0,0.0,0.0)],
    [(1, (1,0,0), 1),
     (1, (0,1,0), 1),
     (1, (0,0,1), 1)]
)


const TRIANGULAR_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),
    [(0.0,0.0)],
    [(1, (1,0), 1),
     (1, (0,1), 1),
     (1, (-1,1), 1)]
)

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

const KAGOME_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),

    [(0.0, 0.0),                 # 1
     (0.5, 0.0),                 # 2
     (0.25, sqrt(3)/4)],         # 3

    [
     # 1 connections
     (1, (0,0), 2),
     (1, (0,0), 3),
     (1, (-1,0), 2),
     (1, (0,-1), 3),

     # 2 connections
     (2, (0,0), 1),
     (2, (0,0), 3),
     (2, (1,0), 1),
     (2, (1,-1), 3),

     # 3 connections
     (3, (0,0), 1),
     (3, (0,0), 2),
     (3, (0,1), 1),
     (3, (-1,1), 2)
    ]
)
