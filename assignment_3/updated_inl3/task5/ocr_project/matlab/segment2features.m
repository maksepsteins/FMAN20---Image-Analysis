function features = segment2features(I)

[rows,cols] = size(I);

top = [0,0];
right = [0,0];
bot = [0,0];
left = [0,0];

for r = 1:rows
    for c = 1:cols
        if I(r,c) > 0
            bot = [r,c];
            if top == [0,0]
                top = [r,c];
            end
            if left == [0,0]
                left = [r,c];
            end
            if c < left(2)
                left = [r,c];
            end
            if right == [0,0]
                right = [r,c];
            end
            if right(2) < c
                right = [r,c];
            end
        end
    end
end
top = top(1) - 1;
bot = bot(1) + 1;
right = right(2) + 1;
left = left(2) - 1;
number = zeros(abs(top-bot), abs(right-left));

for r = top:bot
    for c = left:right
        try
            if I(r,c) ~= 0
                number(r-top+1,c-left+1) = 1;
            else
                number(r-top+1,c-left+1) = 0;
            end
        catch
        end
    end
end

[height, width] = size(number);
x_mid = round(width/2);
y_mid = round(height/2);

%Nbr of holes in the image, 1 is subtracted to not count the background
nbrholes = max(max(bwlabel(not(number)))) - 1;

%Density of white pixels in the image
density = sum(sum(number)) / numel(number);

midcolumndensity = number(:,x_mid-2:x_mid+2);
midcolumndensity = sum(sum(midcolumndensity))/numel(midcolumndensity);

midrowdensity = number(y_mid-2:y_mid+2,:);
midrowdensity = sum(sum(midrowdensity))/numel(midrowdensity);

upperhalf = number(1:y_mid,:);
lowerhalf = number(y_mid:end,:);

upperhalfdensity = sum(sum(upperhalf)) / numel(upperhalf);
lowerhalfdensity = sum(sum(lowerhalf)) / numel(lowerhalf);

proportionaldensity = upperhalfdensity - lowerhalfdensity;
                
hozkernel = 1/15*[0,0,0,0,0;
                  1,1,1,1,1;
                  1,1,1,1,1;
                  1,1,1,1,1;
                  0,0,0,0,0];

hozfeatures = conv2(number,hozkernel,'same');

hozfeatures = sum(sum(hozfeatures))/sum(sum(number));

vertkernel = 1/15*[0,1,1,1,0;
                   0,1,1,1,0;
                   0,1,1,1,0;
                   0,1,1,1,0;
                   0,1,1,1,0];
               
vertfeatures = conv2(number,vertkernel,'same');
vertfeatures = sum(sum(vertfeatures))/sum(sum(number));

center_of_mass = regionprops(number, 'Centroid');
center_of_mass = center_of_mass.Centroid - [x_mid,y_mid];

features = [nbrholes,center_of_mass(2), proportionaldensity,midcolumndensity,midrowdensity, hozfeatures,vertfeatures];

