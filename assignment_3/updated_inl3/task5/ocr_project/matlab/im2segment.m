function S = im2segment(im)

nrofsegments = 5; % could vary, probably you should estimate this
S = cell(1,nrofsegments);
m = size(im,1);
n = size(im,2);

for r = 1:m 
    for c=1:n
        if im(r, c) >= 27
            im(r, c) = 1;
        else
            im(r,c) = 0;
        end
    end
end

neighborKernel = [1,1,1;1,0,1;1,1,1];
nbrNeighbors = conv2(im, neighborKernel, 'same');

for r = 1:m 
    for c=1:n
        if nbrNeighbors(r, c) <= 2
            im(r, c) = 0;
        elseif nbrNeighbors(r, c) >= 7 
            im(r, c) = 1;  
        end
    end
end

im = bwlabel(im);
[im,~] = imsegkmeans(uint8(im),nrofsegments + 1);
blackZone = mode(mode(im));

for kk = 1:nrofsegments
    currentVal = 0;
    S{kk} = zeros(m,n);
    for c = 1:n
        for r = 1:m
            if im(r,c) ~= blackZone && currentVal == 0
                currentVal = im(r,c);
            end
            if im(r,c) == currentVal
                S{kk}(r,c) = 255;
                im(r,c) = blackZone;
            else
                S{kk}(r,c) = 0;
            end
        end
    end
end