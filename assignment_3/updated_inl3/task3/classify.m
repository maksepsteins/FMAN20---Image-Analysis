

function y = classify(x, classification_data)

    nrfeatures = size(x,1);
    nrsamples = size(x,2);
    y = zeros(1,nrsamples);

    for s = 1:nrsamples
        y1_total = 0;
        y2_total = 0;
        
        for f = 1:nrfeatures
            
            mean1f = classification_data.class1(1,f);
            stdv1f = classification_data.class1(2,f);
            
            mean2f = classification_data.class2(1,f);
            stdv2f = classification_data.class2(2,f);
            
            y1 = normpdf(x(f,s), mean1f, stdv1f);
            y2 = normpdf(x(f,s), mean2f, stdv2f);
            
            y1_total = y1_total + log(y1);
            y2_total = y2_total + log(y2);
            
        end
        
        score1 = y1_total + log(classification_data.class1(:,nrfeatures + 1));
        score2 = y2_total + log(classification_data.class2(:,nrfeatures + 1));
        
        if score1 >= score2
            y(s) = -1;
        elseif score2 > score1
            y(s) = 1;
        end
        
    end
% IMPLEMENT YOUR CHOSEN MACHINE LEARNING CLASSIFIER HERE
    
end

