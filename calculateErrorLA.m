function errorLA = calculateErrorLA(x,y,theta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

errorLA = 0;

d = length(y);
x = horzcat(ones(d,1),x);

for i = 1:d
    
    C = x(i,:);
    hypothesis =  C * theta ;
    
    errorLA = errorLA + ((hypothesis-y(i))^2);

end

errorLA = errorLA * (2/d);

end

