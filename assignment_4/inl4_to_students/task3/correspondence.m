a1 = [0, -2, 1];
a2 = [-3, 0, 1];
a3 = [-2, -4, 1];

A = [a1; a2; a3];

b1 = [-8, -2, 1];
b2 = [0, 3, 1];
b3 = [4, 1, 1];

B = [b1; b2; b3];

F =  [2,   2,  4;
      3,   3,  6;
     -5, -10, -6];

for i = 1:3
    for j = 1:3
        if (B(j,:)*F*A(i,:).' == 0)
            disp("Point Correspondence between a" + i + " and b" + j);
        end
    end
end