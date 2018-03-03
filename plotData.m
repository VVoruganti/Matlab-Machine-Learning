function plotData(x,y)
% Makes an initial plot of the input and output variables for univariate linear regression. 

figure;

plot(x,y,'rx');

title('Strength vs Amount of Cement');
ylabel('Strength');
xlabel('Amount of Cement');

end

