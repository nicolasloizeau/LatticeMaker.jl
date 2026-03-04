

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
     (1, (0,-1), 1),
     (1, (-1,0), 1)]
)

function positions(lattice::Lattice{2})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    site_positions = []
    for i in 0:size[1]-1, j in 0:size[2]-1
        for site in cell.sites
            pos = site .+ i.*cell.vectors[1] .+ j.*cell.vectors[2]
            push!(site_positions, pos)
        end
    end
    return site_positions
end


function site_index(lattice::Lattice{2}, i::Int, j::Int, k::Int)
    size = lattice.size
    return k + k*j + k*size[2]*i
end

function site_indexes(lattice::Lattice{2})
    size = lattice.size
    indexes = []
    for i in 0:size[1]-1, j in 0:size[2]-1
        for k in 1:length(lattice.cell.sites)
            push!(indexes, site_index(lattice, i, j, k))
        end
    end
    return indexes
end


function edges(lattice::Lattice{2})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    edge_list = []
    for i in 0:size[1]-1, j in 0:size[2]-1
        for (site1, (di, dj), site2) in cell.edges
            i2 = i + di
            j2 = j + dj
            index1 = site_index(lattice, i, j, site1)
            index2 = site_index(lattice, i2, j2, site2)
            if (0 <= i2 < size[1]) && (0 <= j2 < size[2])
                push!(edge_list, (index1, index2))
            end
        end
    end
    return remove_bidirectional(edge_list)
end

function remove_bidirectional(edges)
    edges = sort.(collect.(edges))
    unique_edges = unique(edges)
    return unique_edges
end
