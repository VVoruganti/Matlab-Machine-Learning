function [theta,errorIndexMulti] = gradientDescentMulti(x1,x2,x3,x4,y,theta,alpha,num_iters)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
d = length(y);
ind = horzcat(ones(d,1),x1,x2,x3,x4);

errorIndexMulti = zeros(num_iters,1);

for iters = 1:num_iters

temp0 = 0;
temp1 = 0;
temp2 = 0;
temp3 = 0;
temp4 = 0;

for i = 1:d

    temp0 = temp0 + ((ind(i,:) * theta) - y(i))*ind(i,1);
    temp1 = temp1 + ((ind(i,:) * theta) - y(i))*ind(i,2);
    temp2 = temp2 + ((ind(i,:) * theta) - y(i))*ind(i,3);
    temp3 = temp3 + ((ind(i,:) * theta) - y(i))*ind(i,4);
    temp4 = temp4 + ((ind(i,:) * theta) - y(i))*ind(i,5);

end

    theta(1,1) = theta(1,1) - (temp0 * alpha * (2/d));
    theta(2,1) = theta(2,1) - (temp1 * alpha * (2/d));
    theta(3,1) = theta(3,1) - (temp2 * alpha * (2/d));
    theta(4,1) = theta(4,1) - (temp3 * alpha * (2/d));
    theta(5,1) = theta(5,1) - (temp4 * alpha * (2/d));

    errorIndexMulti(iters,1) = calculateErrorMulti(x1,x2,x3,x4,y,theta);
    
end

end

