function [theta,costIndex] = gradientDescent(x,y,theta,alpha,num_iters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


d = length(x);

costIndex = zeros(length(num_iters),1);

for iters = 1:num_iters

temp0 = 0;
temp1 = 0;
    
for i = 1:d
    temp0 = temp0 + ( theta(1,1) + theta(2,1) * x(i,1)) - y(i,1);
    temp1 = temp1 + ( (theta(1,1) + theta(2,1) * x(i,1) - y(i,1)) * x(i,1) ); 
end

theta(1,1) = theta(1,1) - (temp0 * alpha * (2/d));
theta(2,1) = theta(2,1) - (temp1 * alpha * (2/d));

costIndex(iters,1) = calculateError(x,y,theta);

end

end