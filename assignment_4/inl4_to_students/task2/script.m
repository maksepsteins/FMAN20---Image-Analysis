data = load('heart_data.mat');

mean_background = mean(background_values);
std_background = std(background_values);

mean_chamber = mean(chamber_values);
std_chamber = std(chamber_values);

[height,width] = size(im);

edges = edges4connected(width,height,1);

reshaped_im = reshape(im,[height*width,1]);
weight_graph = zeros(1,height*width,4);

for v = 300:304
    neighbours = find(edges(:,1) == v | edges(:,2) == v);
    disp(v)
    disp(neighbours)
    for n=1:max(size(neighbours))
        neighbour = neighbours(n);
    end
end

