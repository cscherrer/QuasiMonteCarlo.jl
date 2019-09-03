module QuasiMonteCarlo




include("mean.jl")


using Sobol





collect(Drop(100) |> BoxMuller() |> Mean() |> Take(200) |> Drop(100), SobolSeq(2)) |> plot


incircle(x) = transpose(x) * x < 1

computeπ(tol) = foldl(right, 
       Map(incircle) 
    |> Mean() 
    |> Drop(10) 
    |> Map(x -> x*4) 
    |> TakeWhile(x -> x.err > tol)
    , SobolSeq(2)
    )

computeπ(0.001)

f(n) = foldl(right, 
       Map(incircle) 
    |> Mean() 
    |> Drop(10) 
    |> TakeWhile(x -> x.err > 0.01)
    , SobolSeq(2n)
    )

f(n) = foldl(right, Map(incircle) 
|> Mean() 
|> DropWhile(x -> x==0)
|> Take(3)
# |> TakeWhile(x -> x.err > 0.01)
, SobolSeq(2n)
)


end # module
