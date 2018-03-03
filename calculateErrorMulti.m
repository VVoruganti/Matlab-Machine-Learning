function [errorMulti] = calculateErrorMulti(x1,x2,x3,x4,y,theta)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

errorMulti = 0;
d = length(y);

ind = horzcat(ones(d,1),x1,x2,x3,x4);


for i = 1:d

    hypothesis = (ind(i,:) * theta);
    errorMulti = errorMulti + (hypothesis-y(i))^2;
    
end

errorMulti = errorMulti * (2/d);

end

