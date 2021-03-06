% Machine Learning IA Code Workspace

%% Initialization of program and workspace

% First clears the command window, then closes all windows or graphs that
% may be open, finally clears all variables
clc;close all;clear;

%% Load all variables and prepare them for computation

fprintf("Loading All Variables\n");

rawdata = xlsread("Concrete_Data.xls");

Age = rawdata(:,8);
Strength = rawdata(:,9);
Water = rawdata(:,4);
Cement = rawdata(:,1);
Slag = rawdata(:,2); 
d = length(Cement);
theta = zeros(2,1);

fprintf("Finished Loading all Variables\n");

plotData(Cement,Strength);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Linear Regression Example

fprintf("\nStart of Single Variable Regression\n");

tic; % Start of Timing function. Used to determine how long a set of instructions takes to comput

    alpha = 0.00001;
    num_iters= 3000;

    error = calculateError(Cement,Strength,theta);

    [theta, errorIndex] = gradientDescent(Cement,Strength,theta,alpha,num_iters);

toc; % End of Timing function. Used to determine how long a set of instructions takes to compute.

fprintf("\nEnd of Single Variable Regression\n");

fprintf('\nProgram paused. Press enter to continue.\n');

pause; % pauses program and prevents it from moving on to the next section without a keyboard input 

fprintf("\nAdd final hypothesis line to graph\n");
    
    hold on;
%     plot(Cement, theta(1,1)+theta(2,1)*Cement);
    fplot(@(x) theta(1,1)+theta(2,1)*x,[100,550]);
    legend("Conrete dataset","linear regression");
    hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

fprintf("\nVisualizing meshgrid of error\n");

theta0Range = linspace(-1,1,100);
theta1Range = linspace(-1,1,100);

errorValues = zeros(length(theta0Range),length(theta1Range));

for i = 1:length(theta0Range)
    for j = 1:length(theta1Range)
        delta = [theta0Range(i);theta1Range(j)];
        errorValues(i,j) = calculateError(Cement,Strength,delta);
    end
end


    figure;

    errorValues =errorValues;
    surf(theta0Range,theta1Range,errorValues,'LineStyle',":");
    title("3D Error Representation")
    xlabel("theta 0");
    ylabel("theta 1");
    zlabel("Error Value");
    % figure.EdgeColor = 'none';

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Linear Regression using Linear Algebra

fprintf("\nStart of Linear Regression using Linear Algebra\n");

tic; % Start of Timing function. Used to determine how long a set of instructions takes to comput

    thetaLA = [0;0];

    errorLA = calculateErrorLA(Cement,Strength,thetaLA);

    [thetaLA,errorIndexLA] = gradientDescentLA(Cement,Strength,thetaLA,alpha,num_iters);

toc; % End of Timing function. Used to determine how long a set of instructions takes to compute.

fprintf("\nEnd of Linear Regression using Linear Algebra\n");

pause; % pauses program and prevents it from moving on to the next section without a keyboard input 

%% Polynomial Regression

fprintf("\nStart of Polynomial Regression\n");

 tic; % Start of Timing function. Used to determine how long a set of instructions takes to comput

 thetaPoly = [0;0;0;0];
 errorPoly = calculateErrorPoly(Cement,Strength,thetaPoly);
 
 alphaPoly = 0.0000000000000004;

 [thetaPoly,errorIndexPoly] = gradientDescentPoly(Cement,Strength,thetaPoly,alphaPoly,num_iters);

 toc; % End of Timing function. Used to determine how long a set of instructions takes to compute.
 
 fprintf("\nEnd of Polynomial Regression\n");
 
 pause; % pauses program and prevents it from moving on to the next section without a keyboard input 
 
 plotData(Cement,Strength);
 
 hold on;
    fplot(@(t) thetaPoly(1,1)+thetaPoly(2,1)*t+thetaPoly(3,1)*t.^2+thetaPoly(4,1) * t.^3,[100,550]);
    legend("Conrete dataset","cubic regression");
  hold off;

%% Multivariate Linear Regression using Linear Algebra

fprintf("\nStart of Multivariate Regression\n");

tic; % Start of Timing function. Used to determine how long a set of instructions takes to comput

thetaRawMulti = [0;0;0;0;0];

thetaMulti = [0;0;0;0;0];

alphaMulti = 0.3;

%0.0000004

alphaRawMulti = 0.000006;

[normCement,normSlag,normWater,normAge] = featureScaling(Cement,Slag,Water,Age);

errorRawMulti = calculateErrorMulti(Cement,Slag,Water,Age,Strength,thetaRawMulti);

[thetaRawMulti,errorIndexRawMulti] = gradientDescentMulti(Cement,Slag,Water,Age,Strength,thetaRawMulti,alphaRawMulti,num_iters);

errorMulti = calculateErrorMulti(normCement,normSlag,normWater,normAge,Strength,thetaMulti);

[thetaMulti,errorIndexMulti] = gradientDescentMulti(normCement,normSlag,normWater,normAge,Strength,thetaMulti,alphaMulti,num_iters);



toc; % End of Timing function. Used to determine how long a set of instructions takes to compute.

fprintf("\nEnd of Multivariate Regression\n");

% pause; % pauses program and prevents it from moving on to the next section without a keyboard input 

%% Logistic Regression

% tic; % Start of Timing function. Used to determine how long a set of instructions takes to comput
% toc; % End of Timing function. Used to determine how long a set of instructions takes to compute.
% pause; % pauses program and prevents it from moving on to the next section without a keyboard input 
