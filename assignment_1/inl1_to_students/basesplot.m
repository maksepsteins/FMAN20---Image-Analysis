load('assignment1bases.mat')

figure

r = 1;

for c = 1:4
    subplot(1,4,c)
    a = bases{r}(:,:,c);
    imagesc(a)
    V = a(:);
    d = linspace(0, 19*19-1, 19*19);
    %plot(d, V)
end