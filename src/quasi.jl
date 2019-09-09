export Quasi

struct Quasi{N, F, A <: AbstractVector{<:AbstractFloat}}
    s :: SobolSeq{N}
    x :: A
    f :: F
end

export next!
next!(q::Quasi) = Sobol.next!(q.s, q.x) |> q.f

map(g, q::Quasi) = Quasi(q.s, q.x, g ∘ q.f)


Base.iterate(q::Quasi, state=nothing) = (next!(q), nothing)
Base.eltype(q::Type{Quasi}) = typeof(q.x)
Base.IteratorSize(::Type{Quasi}) = Base.IsInfinite()
Base.IteratorEltype(::Type{Quasi}) = Base.HasEltype()

Quasi(N::Int, f) = Quasi(SobolSeq(N), Vector{Float64}(undef, N), f)
Quasi(N::Int) = Quasi(SobolSeq(N), Vector{Float64}(undef, N), identity)


function Transducers.__foldl__(rf, val, q::Quasi)
    for x in q
        val = Transducers.@next(rf, val, x)
    end
    return Transducers.complete(rf, val)
end