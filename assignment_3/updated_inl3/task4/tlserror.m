function error = tlserror(k,m,x,y)
    npoints = max(size(x));
    error = 0;
    
    for i = 1:npoints
        error = error + (abs(-k*x(i) + y(i) - m)/sqrt((-k)^2 + 1))^2;
    end
    
end

