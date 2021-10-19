load('assignment1bases.mat')

norms = {zeros(400,1), zeros(400,1), zeros(400,1)};
for i = 1:3
    e = {bases{i}(:,:,1); bases{i}(:,:,2); bases{i}(:,:,3); bases{i}(:,:,4)};
    for j = 1:size(stacks{1},3)
        u = stacks{2}(:,:,j);
        u = u - mean(u);
        C = cov(u);
        [eigen_vectors,eigen_values] = eig(C);
        u_updated = eigen_vectors' * u';
        u_updated = u_updated';
        u_updated = fliplr(u_updated);
        x = {dot(u_updated, e{1}), dot(u_updated, e{2}), dot(u_updated, e{3}), dot(u_updated, e{4})};
        u_p = zeros(size(x{1}));
        for k = 1:4
            u_p = u_p + x{k}*e{k};
        end
        norms{i}(j) = norm(u - u_p);
    end
end

means = [mean(norms{1}) mean(norms{2}) mean(norms{3})];
disp(means)
