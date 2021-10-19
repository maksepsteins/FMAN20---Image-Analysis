function y = classify(x, classification_data)

nrfeatures = size(x,1);
nrsamples = size(x,2);
y = zeros(1, nrsamples);
nrclasses = 10; 

for s = 1:nrsamples 
    
    prob_total = 0;
    scores = zeros(1,10);
    
    for c=1:nrclasses
        
        index = strcat('c', num2str(c)); 
        for f = 1:nrfeatures 
            mean = classification_data.(index)(1,f);
            stdv = classification_data.(index)(2,f);
            prob = normpdf(x(f,s), mean, stdv); 
            prob_total = prob_total + log(prob); 
        end
        
        scores(c) = prob_total + log(classification_data.(index)(:,nrfeatures+1); 
        
    end
   
    [~,I] = max(scores);     
    
    %assign sample to a certain class based on score 
    
    y(s) = I; 
    
end

end