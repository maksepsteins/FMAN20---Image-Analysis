function classification_data = class_train(X, Y)
nrfeatures = size(X,1);
nrsamples = size(Y,2);
nrclasses = 10; 

data = struct(); 

for c=1:nrclasses
    classY = [find(Y(1,:) == c)];     
    index = strcat('c', num2str(c)); 
    data.(index) = zeros(2, nrfeatures);
    
    for f = 1:nrfeatures
        classX = X(:,classY); 
        parameters = classX(f,:);
        
        data.(index)(:,f) = transpose([mean(parameters), std(parameters)]); 
    end
    
    apriori = size(classY,2)/nrsamples; 
    data.(index)(:,nrfeatures+1) = apriori;
end

classification_data = data; 
end