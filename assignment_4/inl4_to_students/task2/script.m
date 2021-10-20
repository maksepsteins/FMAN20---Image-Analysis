load('heart_data.mat');

mean_background = mean(background_values);
std_background = std(background_values);

mean_chamber = mean(chamber_values);
std_chamber = std(chamber_values);

[height,width] = size(im);

edges = edges8connected(width,height);

A = zeros(height*width,height*width);
T = zeros(height*width ,2);

for v = 1:height*width 
    neighbours_indices = find(edges(:,1) == v| edges(:,2) == v); 
    neighbours = zeros(1, max(size(neighbours_indices))); 
    
    for i=1:max(size(neighbours_indices))
        neighbours(i) = edges(neighbours_indices(i)); 
    end 
    
    for n=1:max(size(neighbours))
        neighbour = neighbours(n);
        contrast = im(v) - im(neighbour); 
        A(v,neighbour) = contrast;
    end
    
    T(v,1) = -log(P(im(v), mean_chamber, std_chamber));
    T(v,2) = -log(P(im(v), mean_background, std_background));
end

A = sparse(A);
T = sparse(T);

[E Theta] = maxflow(A,T); 

Theta = reshape(Theta ,height,width); 
Theta = double(Theta);

CC = bwconncomp(Theta);
for c = 1:CC.NumObjects
   if max(size(CC.PixelIdxList{c})) < 150
       Theta(CC.PixelIdxList{c}) = 0;
   end
end

Theta = imfill(Theta, 'holes');


imshow(Theta)

function [p] = P(x, mu,sigma)
    p = (1/sqrt(2*pi*(sigma)^2))*exp(-((x-mu)^2/(40*sigma^2)));
end


