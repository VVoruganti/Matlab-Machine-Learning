function [theta,errorHistory] = gradientDescentLA(x, y, theta, alpha, num_iters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

d = length(y); % number of training examples
ind = horzcat(ones(d,1),x);

errorHistory = zeros(num_iters, 1);

for iters = 1:num_iters

temp0 = 0;
temp1 = 0;
    
for i = 1:d
    tempCalc0 = ( ( ind(i,:) * theta ) - y(i) ) * ind(i,1);
    tempCalc1 = ( ( ind(i,:) * theta ) - y(i) ) * ind(i,2); 
    
    temp0 = temp0 + tempCalc0;
    temp1 = temp1 + tempCalc1;
end

theta(1,1) = theta(1,1) - (temp0 * alpha * (2/d));
theta(2,1) = theta(2,1) - (temp1 * alpha * (2/d));

errorHistory(iters,1) = calculateErrorLA(x,y,theta);

end



end

