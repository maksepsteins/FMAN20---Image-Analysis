I = imread('michelangelo_shift.jpg');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

avgR = round(mean(mean(R)));
avgG = round(mean(mean(G)));
avgB = round(mean(mean(B)));

rR = max([avgR,avgG,avgB])/avgR;
rG = max([avgR,avgG,avgB])/avgG;
rB = max([avgR,avgG,avgB])/avgB;

R = R * rR;
G = G * rG;
B = B * rB;

I = cat(3,R,G,B);
imshow(I);