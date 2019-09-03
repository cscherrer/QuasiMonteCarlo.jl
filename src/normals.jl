


# https://www.sciencedirect.com/science/article/pii/S0895717710005935

function boxMuller(u,v)
    r = sqrt(-2 * log(u))
    θ = 2π*v
    (r * cos(θ), r * sin(θ))
end

function boxMuller(u,v,args...)
    (boxMuller(u,v)..., boxMuller(args...)...)
end


normals(u,args...) = boxMuller(u,args...)
normals(u) = norminvcdf(u)
