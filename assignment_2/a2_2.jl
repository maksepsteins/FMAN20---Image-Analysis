using Plots

function g(x)
    if abs(x) <= 1 return abs(x)^3 - 2*abs(x)^2 + 1
    elseif 1 < abs(x) <= 2 return -abs(x)^3 + 5*abs(x)^2 - 8*abs(x) + 4
    else return 0
    end
end

x = 1:0.05:7

f = [3  4  7  4  3  5  6]

F_g(x) = sum(map(i -> g(x-i)*f[i], 1:7))

plot(x,F_g.(x))

#g(3)


#points = map(e -> F_g(e),x)

#printl(points)