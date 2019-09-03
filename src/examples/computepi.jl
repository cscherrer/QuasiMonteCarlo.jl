incircle(x) = transpose(x) * x < 1

computeπ(tol) = foldl(right, 
       Map(incircle) 
    |> Mean() 
    |> Drop(10) 
    |> Map(x -> x*4) 
    |> TakeWhile(x -> x.err > tol)
    , Quasi(2)
    )

computeπ(0.001)
