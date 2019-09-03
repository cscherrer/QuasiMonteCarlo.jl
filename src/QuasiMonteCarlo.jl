module QuasiMonteCarlo

using Transducers
using Sobol
using StatsFuns

include("quasi.jl")
include("normals.jl")
include("mean.jl")

end # module
