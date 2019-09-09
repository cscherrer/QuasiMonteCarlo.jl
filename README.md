# QuasiMonteCarlo

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://cscherrer.github.io/QuasiMonteCarlo.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://cscherrer.github.io/QuasiMonteCarlo.jl/dev)
[![Build Status](https://travis-ci.com/cscherrer/QuasiMonteCarlo.jl.svg?branch=master)](https://travis-ci.com/cscherrer/QuasiMonteCarlo.jl)
[![Codecov](https://codecov.io/gh/cscherrer/QuasiMonteCarlo.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/cscherrer/QuasiMonteCarlo.jl)
[![Coveralls](https://coveralls.io/repos/github/cscherrer/QuasiMonteCarlo.jl/badge.svg?branch=master)](https://coveralls.io/github/cscherrer/QuasiMonteCarlo.jl?branch=master)

```julia
julia> using QuasiMonteCarlo

julia> incircle(x) = transpose(x) * x < 1
incircle (generic function with 1 method)

julia> computeπ(tol) = foldl(right, 
              Map(incircle) 
           |> Mean() 
           |> Drop(10) 
           |> Map(x -> x*4) 
           |> TakeWhile(x -> x.err > tol)
           , Quasi(2)
           )
computeπ (generic function with 1 method)

julia> computeπ(0.001)
3.1417 ± 0.001
```
