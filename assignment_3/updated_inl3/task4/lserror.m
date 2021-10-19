function error = lserror(k,m,x,y)
    
    npoints = max(size(x));
    error = 0;
    
    for i = 1:npoints
        error = error + (y(i) - (k*x(i) + m))^2;
    end
end

