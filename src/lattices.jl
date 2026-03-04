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
     (1, (1,2), 1)]
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

    [(0.0,0.0),                 # 1 : A
     (0.5, sqrt(3)/6)],         # 2 : B

    [
     # A -> B
     (1, (0,0), 2),
     (1, (-1,0), 2),
     (1, (0,-1), 2),

     # B -> A
     (2, (0,0), 1),
     (2, (1,0), 1),
     (2, (0,1), 1)
    ]
)
