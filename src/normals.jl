


# https://www.sciencedirect.com/science/article/pii/S0895717710005935

function boxMuller(u,v)
    r = sqrt(-2 * log(u))
    θ = 2π*v
    (r * cos(θ), r * sin(θ))
end

normals(x::Vector) = normals(x...)
normals(u,v,args...) = (boxMuller(u,v)..., normals(args...)...)
normals(u) = norminvcdf(u)

export StdNormals

StdNormals(N) = Quasi(N,normals)