load('assignment1bases.mat')

im_stack = stacks{1};
im = im_stack(:,:,1);

m = mean(mean(im));

im = im - m;