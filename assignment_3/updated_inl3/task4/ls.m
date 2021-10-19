function leastsquares = ls(x,y)

    npoints = max(size(x));
    xsquared = x;
    
    for i = 1:npoints
        xsquared(i) = x(i)^2;
    end
    
    xy = x;
    
    for i = 1:size(x)
        xy(i) = x(i)*y(i);
    end
    
    sumx = sum(x);
    sumy = sum(y);
    sumxsquared = sum(xsquared);
    sumxy = sum(xy);
    
    k = (npoints*sumxy - sumx*sumy)/(npoints*sumxsquared - sumx^2);
    m = (sumy - k*sumx)/npoints;
    
    leastsquares = [k,m];

end

