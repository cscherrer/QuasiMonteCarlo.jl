using Documenter, QuasiMonteCarlo

makedocs(;
    modules=[QuasiMonteCarlo],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/cscherrer/QuasiMonteCarlo.jl/blob/{commit}{path}#L{line}",
    sitename="QuasiMonteCarlo.jl",
    authors="Chad Scherrer",
    assets=String[],
)

deploydocs(;
    repo="github.com/cscherrer/QuasiMonteCarlo.jl",
)
