function error = calculateError(x,y,theta)
%Calculate the cost
%   Calculates the squared error of the hypothesis model. 

error = 0;
d = length(x);

for i=1:d
 hypothesis = (theta(1,1) + theta(2,1)*x(i));  
 error = error +  ((hypothesis - y(i))^2);   
    
end

error = error * (2/d);

end

