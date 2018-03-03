function [theta,errorIndexPoly] = gradientDescentPoly(x,y,theta,alpha,num_iters)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d = length(y);
ind = horzcat(ones(d,1),x,x.^2,x.^3);

errorIndexPoly = zeros(num_iters,1);

for iters = 1:num_iters

    temp0 = 0;
    temp1 = 0;
    temp2 = 0;
    temp3 = 0;
   
    for i = 1:d        
        temp0 = temp0 + (( theta(1,1) * ind(i,1) + theta(2,1) * ind(i,2) + theta(3,1) * ind(i,3) + theta(4,1) * ind(i,4)) - y(i))*ind(i,1);  
        temp1 = temp1 + (( theta(1,1) * ind(i,1) + theta(2,1) * ind(i,2) + theta(3,1) * ind(i,3) + theta(4,1) * ind(i,4)) - y(i))*ind(i,2);
        temp2 = temp2 + (( theta(1,1) * ind(i,1) + theta(2,1) * ind(i,2) + theta(3,1) * ind(i,3) + theta(4,1) * ind(i,4)) - y(i))*ind(i,3);
        temp3 = temp3 + (( theta(1,1) * ind(i,1) + theta(2,1) * ind(i,2) + theta(3,1) * ind(i,3) + theta(4,1) * ind(i,4)) - y(i))*ind(i,4);
        
    end
    
    theta(1,1) = theta(1,1) - (temp0 * alpha * (2/d));
    theta(2,1) = theta(2,1) - (temp1 * alpha * (2/d));
    theta(3,1) = theta(3,1) - (temp2 * alpha * (2/d));
    theta(4,1) = theta(4,1) - (temp3 * alpha * (2/d));
    
    errorIndexPoly(iters,1) = calculateErrorPoly(x,y,theta);
    
end


end

