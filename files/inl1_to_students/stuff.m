load('assignment1bases.mat')

norms = {zeros(400,1), zeros(400,1), zeros(400,1)};
for i = 1:3
    e = {bases{i}(:,:,1); bases{i}(:,:,2); bases{i}(:,:,3); bases{i}(:,:,4)};
    for j = 1:size(stacks{1},3)
        u = stacks{1}(:,:,j);
        x = {dot(u, e{1}), dot(u, e{2}), dot(u, e{3}), dot(u, e{4})};
        u_p = zeros(size(x{1}));
        for k = 1:4
            u_p = u_p + x{k}*e{k};
        end
        v = u - u_p;
        norms{i}(j) = sqrt(sum(dot(v,v)));
    end
end

means = [mean(norms{1}) mean(norms{2}) mean(norms{3})];
disp(means)
