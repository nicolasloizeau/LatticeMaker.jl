



function SimpleLattices.plot_positions(lattice::Lattice)
    fig = Figure()
    pos = positions(lattice)
    pos = collect.(pos) |> vcat
    pos = reduce(vcat, transpose.(pos))
    dims = size(pos, 2)
    dims in (2, 3) || throw(ArgumentError("Only 2D/3D lattices are supported, got $dims-D"))

    ax = dims == 2 ?
        Axis(fig[1, 1], aspect = DataAspect()) :
        Axis3(fig[1, 1], aspect = :data)

    coords = ntuple(d -> pos[:, d], dims)
    scatter!(ax, coords...; markersize = 15, color = :red)
    return fig
end


function SimpleLattices.plot_lattice(lattice::Lattice)
    site_list = sites(lattice)
    position_list = positions(lattice)
    edge_list = edges(lattice)
    return plot_lattice(site_list, position_list, edge_list)
end


function SimpleLattices.plot_lattice(site_list::Vector, position_list::Vector, edge_list::Vector; node_color=:red, edge_color=:blue)
    fig = Figure()
    position_list = collect.(position_list) |> vcat
    position_list = reduce(vcat, transpose.(position_list))
    dims = size(position_list, 2)
    dims in (2, 3) || throw(ArgumentError("Only 2D/3D lattices are supported, got $dims-D"))

    ax = dims == 2 ?
        Axis(fig[1, 1], aspect = DataAspect()) :
        Axis3(fig[1, 1], aspect = :data)

    coords = ntuple(d -> position_list[:, d], dims)
    scatter!(ax, coords...; markersize = 15, color = node_color)

    for edge in edge_list
        p1 = position_list[edge[1], :]
        p2 = position_list[edge[2], :]
        line_coords = ntuple(d -> [p1[d], p2[d]], dims)
        lines!(ax, line_coords...; color = edge_color)
    end

    for i in 1:size(position_list, 1)
        position = dims == 2 ?
            (position_list[i, 1], position_list[i, 2]) :
            (position_list[i, 1], position_list[i, 2], position_list[i, 3])
        text!(
            ax,
            string(site_list[i]);
            position = position,
            align = (:center, :bottom),
            fontsize = 20,
            color = :black,
        )
    end

    return fig
end
