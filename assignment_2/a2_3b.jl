using Distributions
using Match
using DataTables
using PrettyTables

classes = Dict(
    [1 => [0.4003,0.3988,0.3998,0.3997,0.4010,0.3995,0.3991],
     2 => [0.2554,0.3139,0.2627,0.3802,0.3287,0.3160,0.2924], 
     3 => [0.5632,0.7687,0.0524,0.7586,0.4243,0.5005,0.6769]]
)

function gaussian_classification()
    d1 = Normal(0.4,0.01)
    d2 = Normal(0.3,0.05)
    d3 = Normal(0.5,0.2)
    pcopy = []
    correctclass = []
    actualclass = []
    for n in 1:3
        points = classes[n]
        for p in points
            push!(pcopy,p)
            push!(correctclass,n)
            l1,l2,l3 = pdf(d1, p), pdf(d2, p), pdf(d3, p)
            m = max(l1,l2,l3)
            c = if m == l1
                1
            elseif m == l2
                2
            else
                3
            end
            push!(actualclass,c)
        end
    end
    data = hcat(pcopy,correctclass,actualclass)
    header = (["Point", "Correct Class", "Calculated Class"])
    return pretty_table(data, header)
end

gaussian_classification()
