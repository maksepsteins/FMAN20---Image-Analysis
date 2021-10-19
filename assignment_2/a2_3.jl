trainingpoints = [0.4003,0.3988,0.3998,0.3997, 0.2554,0.3139,0.2627,0.3802,0.5632,0.7687,0.0524,0.7586]
groundtruth = Dict(
    0.4003 => 1, 0.3988 => 1, 0.3998 => 1, 0.3997 => 1,
    0.2554 => 2, 0.3139 => 2, 0.2627 => 2, 0.3802 => 2,
    0.5632 => 3, 0.7687 => 3, 0.0524 => 3, 0.7586 => 3)
datapoints = [0.4010,0.3995,0.3991, 0.3287,0.3160,0.2924, 0.4243,0.5005,0.6769]

function nearestneighbor()
    for d in datapoints
        tcopy = trainingpoints
        sort!(tcopy; by = x -> abs(d - x))
        tcopy = sort(map(k -> get(groundtruth, k, 0) , tcopy[1:min(3,end)]))
        println(string(d) * " in class: " * string(mostOccurringElement(tcopy)))
    end
end

function mostOccurringElement(col)
    dict = Dict()
    foreach(e 
        -> haskey(dict, e) ? push!(dict, e => get(dict, e, 0) + 1) : push!(dict, e => 1)
    ,col)
    return first(sort(map(x -> collect(x),collect(dict)); by = e -> -e[2]))[1]
end

nearestneighbor()