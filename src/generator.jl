
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

function positions(lattice::Lattice{3})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    site_positions = []
    for i in 0:size[1]-1, j in 0:size[2]-1, k in 0:size[3]-1
        for site in cell.sites
            pos = site .+ i.*cell.vectors[1] .+ j.*cell.vectors[2] .+ k.*cell.vectors[3]
            push!(site_positions, pos)
        end
    end
    return site_positions
end






function site_index(lattice::Lattice{2}, i::Int, j::Int, k::Int)
    size = lattice.size
    return k + k*j + k*size[2]*i
end

function site_index(lattice::Lattice{3}, i::Int, j::Int, k::Int, l::Int)
    size = lattice.size
    return l + l*k + l*j*size[3] + l*i*size[2]*size[3]
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


function site_indexes(lattice::Lattice{3})
    size = lattice.size
    indexes = []
    for i in 0:size[1]-1, j in 0:size[2]-1, k in 0:size[3]-1
        for l in 1:length(lattice.cell.sites)
            push!(indexes, site_index(lattice, i, j, k, l))
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

function edges(lattice::Lattice{3})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    edge_list = []
    for i in 0:size[1]-1, j in 0:size[2]-1, k in 0:size[3]-1
        for (site1, (di, dj, dk), site2) in cell.edges
            i2 = i + di
            j2 = j + dj
            k2 = k + dk
            index1 = site_index(lattice, i, j, k, site1)
            index2 = site_index(lattice, i2, j2, k2, site2)
            if (0 <= i2 < size[1]) && (0 <= j2 < size[2]) && (0 <= k2 < size[3])
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
