

function classification_data = class_train(X, Y)

    nrfeatures = size(X,1);
    nrsamples = size(Y,2);
    
    data = struct('class1', zeros(2,nrfeatures),'class2', zeros(2,nrfeatures));
    
    class1Y = [find(Y(1,:)==-1)];
    class1X = X(:,class1Y);
    
    class2Y = [find(Y(1,:)==1)];
    class2X = X(:,class2Y);
    
    for f = 1:nrfeatures
        param1 = class1X(f,:);
        param2 = class2X(f,:);
        data.class1(:,f) = transpose([mean(param1), std(param1)]);
        data.class2(:,f) = transpose([mean(param2), std(param2)]);
    end
    
    
    apriori1 = size(class1X,2)/nrsamples;
    apriori2 = size(class2X,2)/nrsamples;
    
    data.class1(:,nrfeatures+1) = apriori1;
    data.class2(:,nrfeatures+1) = apriori2;
    
    classification_data = data;
    
end

