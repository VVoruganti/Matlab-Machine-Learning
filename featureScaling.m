function [normCement,normSlag,normWater,normAge] = featureScaling(Cement,Slag,Water,Age)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

d = length(Cement);

normCement = zeros(length(Cement),1);
normSlag = zeros(length(Slag),1);
normWater = zeros(length(Water),1);
normAge = zeros(length(Age),1);

rangeCement = range(Cement);
rangeSlag = range(Slag);
rangeWater = range(Water);
rangeAge = range(Age);

meanCement = mean(Cement);
meanSlag = mean(Slag);
meanWater = mean(Water);
meanAge = mean(Age);

for i = 1:d

normCement(i) = (Cement(i) - meanCement)/rangeCement;
normSlag(i) = (Slag(i) - meanSlag)/rangeSlag;
normWater(i) = (Water(i) - meanWater)/rangeWater;
normAge(i) = (Age(i) - meanAge)/rangeAge;

end


end

