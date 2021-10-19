function y = features2class(x,classification_data)

nrfeatures = size(x,1);
nrsamples = size(x,2);
y = zeros(1, nrsamples);
nrclasses = 10; 

for s = 1:nrsamples 
    scores = zeros(10,1); 
    
    for c=1:nrclasses
        prob_total = 0;
        index = strcat('c', num2str(c)); 
        
        for f = 1:nrfeatures 
            mean = classification_data.(index)(1,f);
            stdv = classification_data.(index)(2,f);
            
            if stdv ~= 0
                prob = normpdf(x(f,s), mean, stdv);   
            elseif stdv == 0
                prob = normpdf(x(f,s), mean); 
            end 
            if prob ~= 0
               prob_total = prob_total + log(prob);  
            end
            
        end
        
        scores(c,1) = prob_total + log(classification_data.(index)(1,nrfeatures+1)); 
    end
    
    [~, index] = max(scores);
    y(1,s) = index;
end

end 