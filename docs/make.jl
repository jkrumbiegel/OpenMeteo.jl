using OpenMeteo
using Documenter

DocMeta.setdocmeta!(OpenMeteo, :DocTestSetup, :(using OpenMeteo); recursive=true)

makedocs(;
    modules=[OpenMeteo],
    authors="TheCedarPrince <jacobszelko@gmail.com> and contributors",
    sitename="OpenMeteo.jl",
    format=Documenter.HTML(;
        canonical="https://TheCedarPrince.github.io/OpenMeteo.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/TheCedarPrince/OpenMeteo.jl",
    devbranch="main",
)
