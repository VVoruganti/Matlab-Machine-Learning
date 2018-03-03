function errorPoly = calculateErrorPoly(x,y,theta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d = length(y);
x = [ones(d,1),x,x.^2,x.^3];
errorPoly = 0;


for i = 1:d

    errorPoly = errorPoly + ((x(i,:)*theta)-y(i))^2;

end

errorPoly = errorPoly * (2/d);

end

